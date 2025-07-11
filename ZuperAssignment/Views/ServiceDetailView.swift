//
//  ServiceDetailView.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

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
            // ── Map
            Map(coordinateRegion: $region, annotationItems: [service]) { svc in
                MapMarker(coordinate: svc.coordinate)
            }
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            
            // ── Content
            VStack(alignment: .leading, spacing: 24) {
                
                header
                
                DetailItem(iconName: "text-description",
                           title: "Description",
                           value: service.description)
                
                DetailItem(iconName: "scheduled-time",
                           title: "Scheduled Time",
                           value: SmartDateFormatter.string(from: service.scheduledAt))
                
                DetailItem(iconName: "map-pin",
                           title: "Location",
                           value: "Hard-coded address near pin")
                
                DetailItem(iconName: "notes",
                           title: "Service Notes",
                           value: "• Arrive 15 min early\n• Confirm parts availability")
            }
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: – Header subsection
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text(service.title)
                    .font(.title3.weight(.semibold))
                    .multilineTextAlignment(.leading)
                Spacer(minLength: 4)
                Circle()
                    .fill(priorityColor)
                    .frame(width: 10, height: 10)
            }
            
            HStack {
                StatusBadge(status: service.status)
                Spacer()
            }
        }
    }
    
    private var priorityColor: Color {
        switch service.priority {
        case .low:    .green
        case .medium: .yellow
        case .high:   .red
        }
    }
}

#Preview {
    NavigationStack {
        ServiceDetailView(service: ServicesSampleData.list.first!)
    }
}

