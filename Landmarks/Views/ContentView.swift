//
//  ContentView.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/18
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
