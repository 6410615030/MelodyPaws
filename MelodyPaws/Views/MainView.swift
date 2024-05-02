//
//  ContentView.swift
//  MelodyPaws
//
//  Created by Babypowder on 28/4/2567 BE.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @StateObject var viewModel = AudioViewModel()
    
    var body: some View {
            NavigationView {
                ZStack {
                    Image("main")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            viewModel.play()
                        }
                        .navigationBarHidden(true)
                    NavigationLink(destination: HomeView()) {
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.black)
                                        .padding()
                                        .clipShape(Circle())
                                        .padding()
                                }
                    .offset(x: 24,y: 55)
                    
                    
                }
            }
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

#Preview {
    MainView()
}
