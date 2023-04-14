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
                    //Pass the current landmark to the destination Landmark Detail
                    LandmarkDetail(landmark: landmark)
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
        ForEach(["IPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){
            deviceName in
            LandmarkList()
                //render size
                .previewDevice(PreviewDevice(rawValue: "Iphone SE (2nd Generation)"))
                .previewDisplayName(deviceName)
        }
        
    }
}
