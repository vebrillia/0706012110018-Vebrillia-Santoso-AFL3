//
//  ModelData.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import Combine

//Declare a new model type
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //load the hikes array
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default
    
    //add new computed features array
    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }

    //Add a computed categories dictionary
    var categories: [String: [Landmark]] {
            Dictionary(
                grouping: landmarks,
                by: { $0.category.rawValue }
            )
        }
}


//Create an array of landmarks that has been initialize from landmarkData.json
var landmarks: [Landmark] = load("landmarkData.json")

//Create a load (-:) method that fetches JSON data
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
