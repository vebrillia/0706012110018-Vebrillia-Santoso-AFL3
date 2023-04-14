//
//  LandmarkList.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    //Set show favorites
    @State private var showFavoritesOnly = false
    
    //Compute a filtered version of the landmarks list
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //Embed the dynamically generated list of landmarks
        NavigationView{
            //Pass the model data's landmarks array to the List initializer
            List {
                //Add toggle view
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    //Wrap the returned row
                    NavigationLink{
                        //Pass the current landmark to the destination Landmark Detail
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        //returning a LandmarkRow from the closure
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            //Call the navigation Title
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //show only single version of the list
        LandmarkList()
            .environmentObject(ModelData())
    }
}
