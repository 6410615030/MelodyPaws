//
//  HomeView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
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
                
                NavigationView {
                    VStack {
                        if !viewModel.isSignedIn, viewModel.currentUserId.isEmpty {
                            LoginView()
                        } else {
                            NavigationLink("play", destination: GameView())
                            
                        }
                    }
                }
            }
        }
}

#Preview {
    HomeView()
}
