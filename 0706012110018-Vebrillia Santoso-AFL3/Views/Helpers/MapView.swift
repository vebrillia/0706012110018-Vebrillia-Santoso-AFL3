//
//  MapView.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    //Add a coordinate property to Maap View
    var coordinate: CLLocationCoordinate2D
    
    //Add an onAppear view modifier
    //@State private var region = MKCoordinateRegion()
   
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    
    //zoom enumeration to characterize the zoom level
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    //change the longitude and latitude delta
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }


    var body: some View {
        //to ensure that swiftUI refreshes the map whenever delta changes
        Map(coordinateRegion: .constant(region))
    }
    
    //Add a method that updates the region based on a coordinate value
    var region: MKCoordinateRegion {
            MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //Pass a fixed coordinate
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
