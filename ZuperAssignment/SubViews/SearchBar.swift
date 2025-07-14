//
//  SearchBar.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onMicTap: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search", text: $text)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(.body)
            
            Spacer(minLength: 4)
            
            Button(action: onMicTap) {
                Image(systemName: "mic.fill")
                    .foregroundColor(.secondary)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}

