//
//  settingsView.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import SwiftUI

struct settingsView: View {
    var body: some View {
        @StateObject var viewModel = ProfileViewModel()
        //dont have turn off sound yet
            NavigationView {
                List {
                    NavigationLink(destination: changePasswordView()) {
                        Text("Change Password")
                    }
                    
                    Button {
                        viewModel.logOut()
                    } label: {
                        Text("Logout")
                    }
                }
                .navigationBarTitle("Settings")
            }
        }
}

#Preview {
    settingsView()
}
