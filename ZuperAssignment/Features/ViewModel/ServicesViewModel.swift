//
//  ServicesViewModel.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class ServicesViewModel: ObservableObject {

    // MARK: – Public, bindable properties
    @Published private(set) var displayed: [Service] = []
    @Published var searchText: String = ""

    // MARK: – Internal state
    @Published private var all: [Service] = ServicesSampleData.list
    private var cancellables = Set<AnyCancellable>()

    // MARK: – Init sets up the Combine pipeline
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .combineLatest($all)
            .map(Self.filter(query:services:))
            .assign(to: &$displayed)
    }

    // MARK: – Pull-to-refresh
    func refresh() async {
        try? await Task.sleep(for: .seconds(Int.random(in: 2...3)))

        withAnimation { all.shuffle() }
    }

    // MARK: – Helper
    private static func filter(query: String, services: [Service]) -> [Service] {
        guard !query.isEmpty else { return services }
        let q = query.lowercased()
        return services.filter {
            $0.title.lowercased().contains(q) ||
            $0.customerName.lowercased().contains(q) ||
            $0.description.lowercased().contains(q)
        }
    }
}
