//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkSettings: View {
    //add appstorage property that uses the same key as in the map view
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium

    
    var body: some View {
        //picker that controls the zoom value through a binding
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
