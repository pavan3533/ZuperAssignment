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
    
    // MARK: – Header with centered status dot
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline) {
                Text(service.title)
                    .font(.title3.weight(.semibold))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 6)
                
                Circle()
                    .fill(statusDotColor)
                    .frame(width: 10, height: 10)
                    .alignmentGuide(.firstTextBaseline) { context in
                        context[VerticalAlignment.center] // vertically center it with the text baseline
                    }
            }

            StatusBadge(status: service.status)
        }
    }
    // status-specific colour
    private var statusDotColor: Color {
        switch service.status {
        case .planned:  .blue
        case .scheduled: Color(#colorLiteral(red: 0.49, green: 0.83, blue: 0.13, alpha: 1))// light green
        case .confirmed: Color(#colorLiteral(red: 0.20, green: 0.78, blue: 0.35, alpha: 1))// green
        case .approved:  .red
        }
    }
}

#Preview {
    NavigationStack {
        ServiceDetailView(service: ServicesSampleData.list.first!)
    }
}

