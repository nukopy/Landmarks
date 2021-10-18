//
//  Landmark.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/18
//  
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    // struct for inner of Landmark
    struct Coordinates: Hashable, Codable {
        // 横緯・経縦
        var latitude: Double // 緯度
        var longitude: Double // 経度
    }
}
