//
//  MapView.swift
//  Landmarks
//
//  Created by user on 10/19/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    var parkName: String
    var coordinates: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
        
    private func setRegion() {
        var centerCoord = coordinates
        
        if let center = coordCached[parkName] {
            centerCoord = center
            print("--Cached coord for park \(parkName) : \(center)")
        }

        region = MKCoordinateRegion(center: centerCoord,
                                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion()
                print("-- setRegion() called for (\(coordinates.latitude), \(coordinates.longitude))")
            }
            .onDisappear {
                coordCached[parkName] = region.center
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(parkName: "NONAME",
                coordinates: CLLocationCoordinate2D(
                    latitude: 34.011_286,
                    longitude: -116.166_868)
                )
    }
}

