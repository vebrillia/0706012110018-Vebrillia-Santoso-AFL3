//
//  LandmarkRow.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkRow: View {
    //Add landmark as a stored property of LandmarkRow
    var landmark: Landmark
    
    var body: some View {
        //Embed the existing text view in an HStack
        HStack{
            //Adding an image
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                
                //Modify the text view to use the landmark property's name
                Text(landmark.name)
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            //Add if for favorite
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical,4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        //Add the landmark parameter to te LandmarkRow initializer
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
               
        }
            //Set size
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
