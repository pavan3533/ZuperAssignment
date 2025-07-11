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
            scheduledAt: Calendar.current.date(byAdding: .hour, value: 2, to: .now)!,
            status: .planned,
            priority: .low,
            coordinate: .init(latitude: 37.773972, longitude: -122.431297) // San Francisco
        ),
        Service(
            id: UUID(),
            title: "Modern Workspace Makeover",
            customerName: "Acme Corp",
            description: "Revitalize your workspace with stylish,modern decor that inspires creativity.",
            scheduledAt: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
            status: .scheduled,
            priority: .medium,
            coordinate: .init(latitude: 34.052235, longitude: -118.243683) // Los Angeles
        ),
        Service(
            id: UUID(),
            title: "Contemporary Office Transformation",
            customerName: "Beta Solutions",
            description: "Elevate your office environment with chic,innovative design that spark inspiration.",
            scheduledAt: Calendar.current.date(byAdding: .day, value: -1, to: .now)!,
            status: .confirmed,
            priority: .low,
            coordinate: .init(latitude: 40.712776, longitude: -74.005974) // New York
        ),
        Service(
            id: UUID(),
            title: "Modern Workspace Overhaul",
            customerName: "Alpha Innovations",
            description: "Transform your workspace with stylish, cutting-edge designs that inspire creativity.",
            scheduledAt: ISO8601DateFormatter().date(from: "2024-11-15T14:30:00Z")!,
            status: .approved,
            priority: .medium,
            coordinate: .init(latitude: 51.507351, longitude: -0.127758) // London
        )
    ]
}
