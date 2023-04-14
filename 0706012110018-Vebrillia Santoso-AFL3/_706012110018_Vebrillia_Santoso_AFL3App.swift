//
//  _706012110018_Vebrillia_Santoso_AFL3App.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
