//
//  ServiceRow.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import SwiftUI

struct ServiceRow: View {
    let service: Service
    
    // MARK: – Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .top, spacing: 6) {
                Text(service.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Spacer(minLength: 4)
                
                Circle()
                    .fill(priorityColor)
                    .frame(width: 8, height: 8)
                    .accessibilityHidden(true)
            }
            
            // Customer line
            HStack(spacing: 4) {
                Image("user-circle")
                    .renderingMode(.template)
                Text(service.customerName)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            // Description line
            HStack(spacing: 4) {
                Image("text-description")
                    .renderingMode(.template)
                Text(service.description)
                    .lineLimit(2)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            // Status badge + date
            HStack {
                StatusBadge(status: service.status)
                Spacer()
                Text(SmartDateFormatter.string(from: service.scheduledAt))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 2, y: 1)
        )
        .accessibilityElement(children: .combine)
    }
    
    // MARK: – Helpers
    private var priorityColor: Color {
        switch service.priority {
        case .low:    .green
        case .medium: .yellow
        case .high:   .red
        }
    }
}

#Preview {
    ServiceRow(service: ServicesSampleData.list.first!)
        .padding()
        .previewLayout(.sizeThatFits)
}
