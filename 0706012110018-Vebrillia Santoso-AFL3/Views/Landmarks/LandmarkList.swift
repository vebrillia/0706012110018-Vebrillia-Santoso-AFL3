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
    //add a filter state variable, defaulting to the all case
    @State private var filter = FilterCategory.all
    //state variable for the selected landmark
    @State private var selectedLandmark: Landmark?
    
    //to describe filter state
    enum FilterCategory: String, CaseIterable, Identifiable {
            case all = "All"
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"

            var id: FilterCategory { self }
        }
    
    //Compute a filtered version of the landmarks list
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            //update filtered Landmarks and combined with the category of a given landmark
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    //match navigation title with state of tke filter
    var title: String {
           let title = filter == .all ? "Landmarks" : filter.rawValue
           return showFavoritesOnly ? "Favorite \(title)" : title
       }
    //computed property that indicates the index of the selected landmark
    var index: Int? {
            modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
        }


    var body: some View {
        //Embed the dynamically generated list of landmarks
        NavigationView{
            //initialize the list with a binding to the selected value
            List(selection: $selectedLandmark) {

                ForEach(filteredLandmarks) { landmark in
                    //Wrap the returned row
                    NavigationLink{
                        //Pass the current landmark to the destination Landmark Detail
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        //returning a LandmarkRow from the closure
                        LandmarkRow(landmark: landmark)
                    }
                    //add tag to the navigation link
                    .tag(landmark)
                }
            }
            //Call the navigation Title
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        //to set the filter category
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        //favorites toggle
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            //placeholder for the secondview in wide layout
            Text("Select a Landmark")
        }
        //providing a binding the value from the landmarks array
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}
        
//        //using navigation stack
//        NavigationStack{
//            List(landmarks){ landmark in
//                NavigationLink{
//                    LandmarkDetail(landmark: landmark)
//
//                }label: {
//                    LandmarkRow(landmark: landmark)
//                }
//
//            }
//        }
    

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //show only single version of the list
        LandmarkList()
            .environmentObject(ModelData())
    }
}
