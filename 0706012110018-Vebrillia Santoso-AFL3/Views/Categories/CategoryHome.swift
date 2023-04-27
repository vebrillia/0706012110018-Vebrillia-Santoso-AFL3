//
//  CategoryHome.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        // to host the different categories
        NavigationView{
            // display categories using a List
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")

        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
