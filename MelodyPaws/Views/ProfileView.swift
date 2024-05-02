//
//  ProfileView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        
        VStack {
            if let user = viewModel.user {
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
                    
                    
//                    NavigationLink(destination: ShopView()) {
//                        HStack {
//                            Circle()
//                                .fill(Color.orange)
//                                .frame(width: 30, height: 30)
//                                .overlay(Image(systemName: "cart").foregroundColor(.white))
//                            
//                        }
//                        .padding()
//                    }
        //            Toggle(isOn: $isMicOn) {
        //                                Image(systemName: isMicOn ? "mic.fill" : "mic.slash.fill")
        //                            }
        //                            .padding()
                                    
                                    NavigationLink(destination: Wardrobe()) {
                                        HStack{
                                            Image(systemName: "music.note")
                                                .padding()
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                                .frame(width: 30, height: 30)
                                        }
                                        

                                    }
                    
                }
                Text("Best Score : \(user.bestScore)") // Display the best score
                                        .font(.title)
                                        .padding()
                Image("\(user.wearing)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 500, height: 500)
                VStack {
                    
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
            } else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
