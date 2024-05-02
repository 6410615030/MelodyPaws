//
//  HomeView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct HomeView: View {
<<<<<<< refs/remotes/origin/main
    
=======
    @StateObject var tuneViewModel = AudioTuneViewModel()
>>>>>>> track
    @StateObject var viewModel = HomeViewModel()
    @State private var isRecording = false
    
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
                NavigationLink("tracks", destination: TrackView())
                    .padding()
                VStack {
                    if !viewModel.isSignedIn, viewModel.currentUserId.isEmpty {
                        LoginView()
                    } else {
                        NavigationLink(destination: GameView()) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("PLAY")
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(30)
                        }
                    }
                }
    



                

                
                
                Button(isRecording ? "Stop Recording" : "Start Recording") {
                    isRecording.toggle()
                    if isRecording {
                        tuneViewModel.startRecordingTapped()
                    } else {
                        tuneViewModel.stopRecordingTapped()
                    }
                }
<<<<<<< refs/remotes/origin/main
                
=======
>>>>>>> track
            }
        }
    }
}

#Preview {
    HomeView()
}
