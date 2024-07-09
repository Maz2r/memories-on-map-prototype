//
//  MapView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var memories: [Memory]
    @Binding var selectedMemory: Memory?
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        let annotations = memories.map { memory -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.coordinate = memory.coordinate
            return annotation
        }
        uiView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let coordinate = view.annotation?.coordinate, let memory = parent.memories.first(where: { $0.coordinate.latitude == coordinate.latitude && $0.coordinate.longitude == coordinate.longitude }) {
                parent.selectedMemory = memory
            }
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Memory"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false // Disable callout
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
    }
}

struct MapView_Previews: PreviewProvider {
    @State static private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.0347306, longitude: 129.3687305),
        span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
    )
    @State static private var selectedMemory: Memory? = nil

    static var previews: some View {
        MapView(
            region: $region,
            memories: Memory.sampleData,
            selectedMemory: $selectedMemory
        )
    }
}
