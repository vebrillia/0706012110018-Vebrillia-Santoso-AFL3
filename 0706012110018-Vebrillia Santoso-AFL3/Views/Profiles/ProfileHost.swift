//
//  ProfileHost.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct ProfileHost: View {
    // add an environtment view property
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

        var body: some View {
            // display new summary view
            VStack(alignment: .leading, spacing: 20) {
                // edit button 
                HStack {
                    // cancel button
                    if editMode?.wrappedValue == .active {
                        Button("Cancel", role: .cancel) {
                            draftProfile = modelData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    }
                    Spacer()
                    EditButton()
                }
                // conditional view
                if editMode?.wrappedValue == .inactive{
                    // read the user's profile data from environtment
                    ProfileSummary(profile: modelData.profile)
                }else{
                    ProfileEditor(profile: $draftProfile)
                        // populate the editor with the correct profile data
                        .onAppear {
                            draftProfile = modelData.profile
                        }
                        .onDisappear {
                            modelData.profile = draftProfile
                        }
                }
            }
            .padding()
        }
    }

    struct ProfileHost_Previews: PreviewProvider {
        static var previews: some View {
            ProfileHost()
                .environmentObject(ModelData())
        }
    }
