//
//  ContentView.swift
//  MelodyPaws
//
//  Created by Babypowder on 28/4/2567 BE.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @StateObject var audioManager = AudioManager()
    
    var body: some View {
        NavigationView {
            NavigationLink("Play", destination: HomeView())
        }
        .onAppear{
            audioManager.setupAudioSession()
            audioManager.startPlayback(trackIndex: 0)
        }
    }
    
//    var accountView: some View {
//        TabView {
//
//            
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person.circle")
//                }
//            
//        }
//    }
}

#Preview {
    MainView()
}
