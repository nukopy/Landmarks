//
//  LandmarkList.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/18
//  
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([
            "iPhone SE (2nd generation)",
            "iPhone 12",
//            "iPhone XS Max",
//            "iPod touch (7th generation)",
//            "iPad Pro (12.9-inch) (5th generation)"
        ], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
