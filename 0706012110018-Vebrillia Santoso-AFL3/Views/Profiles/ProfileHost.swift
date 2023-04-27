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
                    Spacer()
                    EditButton()
                }
                // conditional view
                if editMode?.wrappedValue == .inactive{
                    // read the user's profile data from environtment
                    ProfileSummary(profile: modelData.profile)
                }else{
                    ProfileEditor(profile: $draftProfile)
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
