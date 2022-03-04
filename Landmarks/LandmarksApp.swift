//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by user on 10/19/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

