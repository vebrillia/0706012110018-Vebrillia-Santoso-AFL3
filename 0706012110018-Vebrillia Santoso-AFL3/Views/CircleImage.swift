//
//  CircleImage.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct CircleImage: View {
    //Add a stored image property
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        //Pass the image of Turtle Rock
        CircleImage(image: Image("turtlerock"))
    }
}
