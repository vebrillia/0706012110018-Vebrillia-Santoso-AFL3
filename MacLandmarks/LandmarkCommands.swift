//
//  LandmarkCommands.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkCommands: Commands{
    //to track the currently selected landmark
    @FocusedBinding(\.selectedLandmark) var selectedLandmark

    var body: some Commands{
        SidebarCommands()
        
        CommandMenu("Landmark"){
            //change appearance depending on the currently selected landmark and its state
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

//extend the focusedvalues structure
private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
