//
//  LandmarkList.swift
//  Landmarks
//
//  Created by user on 10/19/21.
//

import SwiftUI


struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoriteOnly || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {

            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Show Favorite Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {     LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            //            List(filteredLandmarks) { landmark in
            //                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
            //                    LandmarkRow(landmark: landmark)
            //                }
            //            }

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}

