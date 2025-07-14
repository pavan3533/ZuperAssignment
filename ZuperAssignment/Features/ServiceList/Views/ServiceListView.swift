//
//  ServiceListView.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import SwiftUI

struct ServicesListView: View {
    @StateObject private var viewModel = ServicesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // ── Search Bar with balanced spacing and divider ──
                VStack(spacing: 0) {
                    SearchBar(text: $viewModel.searchText) {
                        print("Mic tapped") // placeholder
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12) // balanced top/bottom
                    
                    Divider()
                }
                
                // ── Services List ────────────────────────────────
                List {
                    ForEach(viewModel.displayed) { service in
                        NavigationLink(value: service) {
                            ServiceRow(service: service)
                                .padding(.vertical, 8)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .refreshable { await viewModel.refresh() }
                .animation(.default, value: viewModel.displayed)
                .navigationDestination(for: Service.self) { ServiceDetailView(service: $0) }
                .overlay {
                    if viewModel.displayed.isEmpty && !viewModel.searchText.isEmpty {
                        ContentUnavailableView(
                            "No results",
                            systemImage: "magnifyingglass",
                            description: Text("Try a different search term")
                        )
                    }
                }
            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ServicesListView()
}
