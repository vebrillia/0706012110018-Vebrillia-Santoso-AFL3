//
//  LandmarkList.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //Embed list for two landmaarks as the list's children
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
