//
//  StatusBadge.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import SwiftUI

struct StatusBadge: View {
    let status: Service.Status
    
    var body: some View {
        Text(status.rawValue.capitalized)
            .font(.caption2.weight(.semibold))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(
                Capsule().fill(statusColor.opacity(0.15))
            )
            .foregroundStyle(statusColor)
    }
    
    private var statusColor: Color {
        switch status {
        case .planned:   .blue
        case .scheduled: .green
        case .confirmed: .green
        case .approved:  .red
        }
    }
}

#Preview {
    VStack(spacing: 8) {
        StatusBadge(status: .planned)
        StatusBadge(status: .scheduled)
        StatusBadge(status: .confirmed)
        StatusBadge(status: .approved)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}

