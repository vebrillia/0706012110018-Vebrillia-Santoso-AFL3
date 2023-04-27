//
//  _706012110018_Vebrillia_Santoso_AFL3App.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

@main
struct _706012110018_Vebrillia_Santoso_AFL3App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        //apply landmarkcommands
        .commands{
            LandmarkCommands()
        }
        
        //add settings scene to macOS
        #if os(macOS)
                Settings {
                    LandmarkSettings()
                }
        #endif
    }
}
