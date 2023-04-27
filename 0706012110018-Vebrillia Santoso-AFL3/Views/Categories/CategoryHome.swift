//
//  CategoryHome.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        // to host the different categories
        NavigationView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                // set navigation title
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
