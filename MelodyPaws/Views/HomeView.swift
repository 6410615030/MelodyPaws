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
                
                Text("Currently wearing: \(viewModel.currentUser?.wearing ?? "default")")
                
                Image("\(viewModel.currentUser?.wearing ?? "default")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                
    
                NavigationLink("wardrobe", destination: Wardrobe())
                    .padding()
                NavigationLink("settings", destination: settingsView(audioManager: AudioManager()))
                    .padding()
                NavigationLink("shop", destination: ShopView())
                    .padding()
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
