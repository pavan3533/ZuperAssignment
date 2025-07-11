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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // ── Title + priority dot
            HStack(alignment: .top) {
                Text(service.title)
                    .font(.system(.headline, design: .default).weight(.semibold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer(minLength: 8)
                
                Circle()
                    .fill(priorityColor)
                    .frame(width: 8, height: 8)
                    .padding(.top, 2)
            }
            
            // ── Customer row
            HStack(spacing: 6) {
                Image("user-circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.secondary)
                    .frame(width: 14, height: 14)
                
                Text(service.customerName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // ── Description row
            HStack(spacing: 6) {
                Image("text-description")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.secondary)
                    .frame(width: 14, height: 14)
                
                Text(service.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            // ── Badge and time
            HStack {
                StatusBadge(status: service.status)
                
                Spacer()
                
                Text(SmartDateFormatter.string(from: service.scheduledAt))
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
        )
        .padding(.horizontal)
    }
    
    private var priorityColor: Color {
        switch service.priority {
        case .low: .green
        case .medium: .yellow
        case .high: .red
        }
    }
}

#Preview {
    ServiceRow(service: ServicesSampleData.list.first!)
}
