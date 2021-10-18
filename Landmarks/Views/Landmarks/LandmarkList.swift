//
//  LandmarkList.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/18
//  
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isShowFavoriteOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!isShowFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        let _ = print(filteredLandmarks)
        NavigationView {
            List {
                Toggle(isOn: $isShowFavoriteOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                    .navigationTitle("Landmarks")
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var deviceName: String = "iPhone 12"

    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
    }
}
