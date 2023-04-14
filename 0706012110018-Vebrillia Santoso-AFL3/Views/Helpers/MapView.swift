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
    @State private var region = MKCoordinateRegion()
            
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    //Add a method that updates the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //Pass a fixed coordinate
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
