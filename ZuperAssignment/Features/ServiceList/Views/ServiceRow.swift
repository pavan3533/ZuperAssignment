//
//  ServiceRow.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import SwiftUI

struct ServiceRow: View {
    let service: Service
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .center) {
                Text(service.title)
                    .font(.system(.headline, design: .default).weight(.semibold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Spacer(minLength: 8)
                
                VStack {
                    Spacer()
                    Circle()
                        .fill(priorityColor)
                        .frame(width: 8, height: 8)
                    Spacer()
                }
                .frame(height: 32) // Approximate height of 2-line title
            }
            
            // ── Customer row ──
            HStack(spacing: 6) {
                Image("user-circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.48, blue: 1, alpha: 1)))
                    .frame(width: 14, height: 14)

                Text(service.customerName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // ── Description row ──
            HStack(spacing: 6) {
                Image("text-description")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.48, blue: 1, alpha: 1)))
                    .frame(width: 14, height: 14)

                Text(service.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
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
        case .low:    Color(#colorLiteral(red: 0.0, green: 0.48, blue: 0.18, alpha: 1)) // dark green
        case .medium: Color(#colorLiteral(red: 0.49, green: 0.83, blue: 0.13, alpha: 1)) // light green
        case .high:   .blue
        }
    }
}

#Preview {
    ServiceRow(service: ServicesSampleData.list.first!)
}
