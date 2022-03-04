//
//  ModelData.swift
//  Landmarks
//
//  Created by user on 10/19/21.

import Foundation
import CoreLocation
import Combine


final class ModelData : ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    print("url from with read json data: \(fileURL)\n")

    do {
        data = try Data(contentsOf: fileURL)
    } catch {
        fatalError("Couldn't load data from \(filename):\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

