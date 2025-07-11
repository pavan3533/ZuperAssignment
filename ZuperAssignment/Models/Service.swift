//
//  Service.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation
import CoreLocation

struct Service: Identifiable, Hashable, Codable {
    enum Status: String, Codable {
        case planned
        case scheduled
        case confirmed
        case approved
    }

    enum Priority: String, Codable {
        case low
        case medium
        case high
    }

    let id: UUID
    var title: String
    var customerName: String
    var description: String
    var scheduledAt: Date
    var status: Status
    var priority: Priority
    var coordinate: CLLocationCoordinate2D
}

// MARK: - Codable Support for CLLocationCoordinate2D
extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(latitude)
        try container.encode(longitude)
    }

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let latitude = try container.decode(CLLocationDegrees.self)
        let longitude = try container.decode(CLLocationDegrees.self)
        self.init(latitude: latitude, longitude: longitude)
    }
}

// MARK: - Hashable & Equatable Support for CLLocationCoordinate2D
extension CLLocationCoordinate2D: Hashable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
