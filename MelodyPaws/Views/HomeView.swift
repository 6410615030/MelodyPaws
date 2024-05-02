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
                HStack {
                    NavigationLink(destination: Wardrobe()) {
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 30, height: 30)
                                .overlay(Image(systemName: "wand.and.stars").foregroundColor(.white))
                            
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: settingsView(audioManager: AudioManager())) {
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 30, height: 30)
                                .overlay(Image(systemName: "gearshape").foregroundColor(.white))
                            
                        }
                        .padding()
                    }
                    
                    
        //            Toggle(isOn: $isMicOn) {
        //                                Image(systemName: isMicOn ? "mic.fill" : "mic.slash.fill")
        //                            }
        //                            .padding()
                                    
//                                    NavigationLink(destination: ProfileView()) {
//                                        HStack{
//                                            Image(systemName: "music.note")
//                                                .padding()
//                                                .background(Color.blue)
//                                                .foregroundColor(.white)
//                                                .clipShape(Circle())
//                                                .frame(width: 30, height: 30)
//                                        }
//                                        
//
//                                    }
                    
                }
                Image("\(viewModel.currentUser?.wearing ?? "default")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 500, height: 500)
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
    



                

                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
