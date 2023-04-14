//
//  Landmark.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

//Define a Landmark structure with a few properties
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    //Add imageName property to read the name of the image from data
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //Add a coordinates property to the structure using a nested
    private var coordinates: Coordinates
    
    //Compute a location coordinate property
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // Struct for add a coordinates property to the structure using a nested
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}

