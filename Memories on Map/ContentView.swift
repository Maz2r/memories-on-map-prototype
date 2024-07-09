//
//  ContentView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import SwiftUI
import MapKit
import BottomSheet

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.0189954294771, longitude: 129.343164578825),
        span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
    )
    @State private var selectedMemory: Memory?
    @State var bottomSheetPosition: BottomSheetPosition = .relativeBottom(0.125)
    @State private var mapType: MKMapType = .standard
    @State var searchText = ""
    
    private func toggleMapType() {
        switch mapType {
        case .standard:
            mapType = .satellite
        case .satellite:
            mapType = .hybrid
        case .hybrid:
            mapType = .standard
        default:
            mapType = .standard
        }
    }
    
    var body: some View {
        ZStack{
            MapView(region: $region, memories: Memory.sampleData, selectedMemory: $selectedMemory)
                .onTapGesture {
                    if selectedMemory != nil {
                        self.bottomSheetPosition = .relative(0.7)
                        self.region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: selectedMemory?.coordinate.latitude ?? 36.0189954294771, longitude: selectedMemory?.coordinate.longitude ?? 129.343164578825),
                            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                        )
                    }
                    self.bottomSheetPosition = .relativeBottom(0.125)
                }
                .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, switchablePositions: [
                    .relativeBottom(0.125),
                    .relative(0.7),
                    .relativeTop(0.925)
                ], headerContent: {
                    //A SearchBar as headerContent.
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("지도 검색", text: self.$searchText)
                    }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                    .padding([.horizontal, .bottom])
                    //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                    .onTapGesture {
                        self.bottomSheetPosition = .relativeTop(0.925)
                    }
                    if selectedMemory != nil {
                        Button(action: {
                            if selectedMemory != nil {
                                self.bottomSheetPosition = .relative(0.7)
                                self.region = MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: selectedMemory?.coordinate.latitude ?? 36.0189954294771, longitude: selectedMemory?.coordinate.longitude ?? 129.343164578825),
                                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                )
                            }
                            self.selectedMemory = nil
                            self.bottomSheetPosition = .relativeBottom(0.125)
                        }) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                                .padding(.vertical, 5)
                                .padding(.trailing, 18)
                        }
                    }
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .padding(.vertical, 5)
                        .padding(.trailing, 18)
                }, mainContent: {
                    if let selectedMemory = selectedMemory {
                        MemoryView(memory: selectedMemory)
                    }
                })
                .enableAppleScrollBehavior()
                .edgesIgnoringSafeArea(.all)
        }
        .onChange(of: selectedMemory) { _ in
            if selectedMemory != nil {
                self.bottomSheetPosition = .relative(0.7)
                self.region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: (selectedMemory?.coordinate.latitude ?? 36.0189954294771) - 0.0165, longitude: selectedMemory?.coordinate.longitude ?? 129.343164578825),
                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                )
            } else {
                self.bottomSheetPosition = .relativeBottom(0.125)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
