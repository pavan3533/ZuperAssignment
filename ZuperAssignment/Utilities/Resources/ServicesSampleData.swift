//
//  ServicesSampleData.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

enum ServicesSampleData {
    
    static let list: [Service] = [
        Service(
            id: UUID(),
            title: "AC Maintenance",
            customerName: "John Carter",
            description: "Quarterly air-conditioner servicing and filter replacement.",
            scheduledAt: Calendar.current.date(byAdding: .hour, value: 2, to: .now)!,
            status: .scheduled,
            priority: .high,
            coordinate: .init(latitude: 37.773972, longitude: -122.431297) // San Francisco
        ),
        Service(
            id: UUID(),
            title: "Kitchen Renovation",
            customerName: "Emily Clarke",
            description: "Full kitchen remodel: demolition, plumbing, tiling, and installation.",
            scheduledAt: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
            status: .planned,
            priority: .medium,
            coordinate: .init(latitude: 34.052235, longitude: -118.243683) // Los Angeles
        ),
        Service(
            id: UUID(),
            title: "Roof Inspection",
            customerName: "Michael Lee",
            description: "Annual roof health check with drone imaging.",
            scheduledAt: Calendar.current.date(byAdding: .day, value: -1, to: .now)!,
            status: .confirmed,
            priority: .low,
            coordinate: .init(latitude: 40.712776, longitude: -74.005974) // New York
        ),
        Service(
            id: UUID(),
            title: "Garden Landscaping",
            customerName: "Sophia Patel",
            description: "Install new irrigation system and seasonal plants.",
            scheduledAt: ISO8601DateFormatter().date(from: "2024-11-15T14:30:00Z")!,
            status: .approved,
            priority: .medium,
            coordinate: .init(latitude: 51.507351, longitude: -0.127758) // London
        )
    ]
}
