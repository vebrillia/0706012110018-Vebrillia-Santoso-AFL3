//
//  ProfileHost.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default

        var body: some View {
            // display new summary view
            VStack(alignment: .leading, spacing: 20) {
                ProfileSummary(profile: draftProfile)
            }
            .padding()
        }
    }

    struct ProfileHost_Previews: PreviewProvider {
        static var previews: some View {
            ProfileHost()
        }
    }
