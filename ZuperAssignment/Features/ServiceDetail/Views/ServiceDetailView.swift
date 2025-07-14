//
//  ServiceDetailView.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import SwiftUI
import MapKit

struct ServiceDetailView: View {
    let service: Service
    @State private var region: MKCoordinateRegion

    // MARK: – Init
    init(service: Service) {
        self.service = service
        _region = State(initialValue: .init(
            center: service.coordinate,
            span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    
    // MARK: – Body
    var body: some View {
        ScrollView {
            // ── Map ─────────────────────────────────────────────
            Map(coordinateRegion: $region, annotationItems: [service]) { svc in
                MapMarker(coordinate: svc.coordinate)
            }
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)

            // ── Content ─────────────────────────────────────────
            VStack(alignment: .leading, spacing: 24) {
                header

                DetailItem(iconName: "user-circle",
                           title: "Customer",
                           value: service.customerName,
                           iconColor: .blue)

                DetailItem(iconName: "text-description",
                           title: "Description",
                           value: service.description,
                           iconColor: .blue)

                DetailItem(iconName: "scheduled-time",
                           title: "Scheduled Time",
                           value: SmartDateFormatter.string(from: service.scheduledAt),
                           iconColor: .blue)

                DetailItem(iconName: "map-pin",
                           title: "Location",
                           value: "Hard-coded address near pin",
                           iconColor: .blue)

                DetailItem(iconName: "notes",
                           title: "Service Notes",
                           value: "• Arrive 15 min early\n• Confirm parts availability",
                           iconColor: .blue)
            }
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: – Header (title + badge)
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(service.title)
                .font(.title3.weight(.semibold))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            StatusBadge(status: service.status)
        }
    }
}

#Preview {
    NavigationStack {
        ServiceDetailView(service: ServicesSampleData.list.first!)
    }
}

