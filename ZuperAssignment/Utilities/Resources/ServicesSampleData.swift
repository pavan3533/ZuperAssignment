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
            title: "Office Space Revamp",
            customerName: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            scheduledAt: buildDate(hour: 15, minute: 0), // 3:00 PM
            status: .planned,
            priority: .medium,
            coordinate: .init(latitude: 37.7749, longitude: -122.4194)
        ),
        Service(
            id: UUID(),
            title: "Modern Workspace Makeover",
            customerName: "Acme Corp",
            description: "Revitalize your workspace with stylish, modern decor that inspires creativity.",
            scheduledAt: buildDate(hour: 15, minute: 30), // 3:30 PM
            status: .scheduled,
            priority: .medium,
            coordinate: .init(latitude: 34.0522, longitude: -118.2437)
        ),
        Service(
            id: UUID(),
            title: "Contemporary Office Transformation",
            customerName: "Beta Solutions",
            description: "Elevate your office environment with chic, innovative designs that spark inspiration.",
            scheduledAt: buildDate(hour: 16, minute: 0), // 4:00 PM
            status: .confirmed,
            priority: .high,
            coordinate: .init(latitude: 40.7128, longitude: -74.0060)
        ),
        Service(
            id: UUID(),
            title: "Modern Workspace Overhaul",
            customerName: "Alpha Innovations",
            description: "Transform your workspace with stylish, cutting-edge designs that inspire creativity.",
            scheduledAt: buildDate(hour: 17, minute: 0), // 5:00 PM
            status: .approved,
            priority: .low,
            coordinate: .init(latitude: 47.6062, longitude: -122.3321)
        ),
        Service(
            id: UUID(),
            title: "Revamp Your Workspace Today",
            customerName: "Innovative Solutions Inc.",
            description: "Upgrade your office with state-of-the-art ergonomic furniture.",
            scheduledAt: buildDate(hour: 18, minute: 0), // 6:00 PM
            status: .confirmed,
            priority: .medium,
            coordinate: .init(latitude: 51.5074, longitude: -0.1278)
        )
    ]
    
    private static func buildDate(hour: Int, minute: Int) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components)!
    }
}
