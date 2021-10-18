//
//  ModelData.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/18
//  
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// Fetch JSON data with a given name from the app's "main" bundle
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Get URL of JSON data file
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldnt find \(filename) in main bundle.")
    }
    
    // Read JSON data into memory as bytes from URL
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could't load \(filename) from main bundle:\n\(error)")
    }
    
    // Decode bytes of JSON data & Initialize JSON date with type T
    do {
        let decoder = JSONDecoder()
        print("decoding...")
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
