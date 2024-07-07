//
//  MapView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import SwiftUI
import MapKit
import BottomSheet

struct MapView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.0189954294771, longitude: 129.343164578825),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
        Map(position: $cameraPosition)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
