//
//  HomeView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct HomeView: View {
   
    var body: some View {
        @StateObject var viewModel = HomeViewModel()
        VStack {
            if !viewModel.isSignedIn, viewModel.currentUserId.isEmpty {
                LoginView()
            } else {
                
                Text("home")
                NavigationLink("change pass", destination: changePasswordView())
                                        .padding()
                NavigationLink("profile", destination: ProfileView())
                                        .padding() //just want to use logout
                NavigationLink("settings", destination: settingsView())
                                        .padding()
                
            }
        }
    }
}

#Preview {
    HomeView()
}
