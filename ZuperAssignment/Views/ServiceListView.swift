//
//  ServiceListView.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import SwiftUI

struct ServicesListView: View {
    @StateObject private var viewModel = ServicesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.displayed) { service in
                    NavigationLink(value: service) {
                        ServiceRow(service: service)
                            .padding(.vertical, 6)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Services")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .refreshable {
                await viewModel.refresh()
            }
            .animation(.default, value: viewModel.displayed)
            .navigationDestination(for: Service.self) { service in
                ServiceDetailView(service: service)
            }
            .overlay {
                if viewModel.displayed.isEmpty && !viewModel.searchText.isEmpty {
                    ContentUnavailableView("No results",
                                           systemImage: "magnifyingglass",
                                           description: Text("Try a different search term"))
                }
            }
        }
    }
}

#Preview {
    ServicesListView()
}
