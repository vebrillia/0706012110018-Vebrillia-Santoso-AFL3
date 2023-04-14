//
//  LandmarkList.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //Embed the dynamically generated list of landmarks
        NavigationView{
            //Pass the model data's landmarks array to the List initializer
            List(landmarks){ landmark in
                //Wrap the returned row 
                NavigationLink{
                    LandmarkDetail()
                }label: {
                    //returning a LandmarkRow from the closure
                    LandmarkRow(landmark: landmark)
                }
                
            }
            //Call the navigation Title
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
