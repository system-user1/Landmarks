//
//  Landmark.swift
//  Landmarks
//
//  Created by user on 10/19/21.
//

import Foundation
import SwiftUI
import MapKit


var coordCached: [String: CLLocationCoordinate2D] = [:]

struct Landmark : Hashable, Codable, Identifiable {
    var id: Int // Not String
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    struct Coordinates : Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
}

