//
//  DetailItem.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import SwiftUI

struct DetailItem: View {
    let iconName: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(iconName)
                .renderingMode(.template)
                .frame(width: 20, height: 20)
                .padding(.top, 2)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.body)
            }
            Spacer()
        }
    }
}

#Preview {
    DetailItem(iconName: "calendar",
               title: "Scheduled Time",
               value: "Today, 2:30 PM")
        .padding()
        .previewLayout(.sizeThatFits)
}

