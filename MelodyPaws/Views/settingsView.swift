//
//  settingsView.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import SwiftUI

struct settingsView: View {
    @StateObject var viewModel = ProfileViewModel()
    @ObservedObject var audioManager: AudioManager
    @State var isActive = false
    var body: some View {
        
        NavigationLink(destination: MainView(), isActive: $isActive){
                                        EmptyView()
                                    }
        //dont have turn off sound yet
        
//        ZStack{
//            Image("settings")
//                .resizable()
//                .scaledToFill()
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
//                .edgesIgnoringSafeArea(.all)
//                .navigationBarHidden(true)
//            VStack{
//                
//            }
//        }
//            NavigationView {
//                List {
//                    NavigationLink(destination: changePasswordView()) {
//                        Text("Change Password")
//                    }
//                    
//                    Button {
//                        viewModel.logOut()
//                    } label: {
//                        Text("Logout")
//                    }
//                }
//                .navigationBarTitle("Settings")
//            }
        NavigationView {
            ZStack{
                Image("settings")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
                
                VStack {
                    Button(action: {
                        AudioManager.shared.toggleSound() // Access the shared instance
                    }) {
                        Image(systemName: AudioManager.shared.isSoundOn ? "speaker.3.fill" : "speaker.slash.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(AudioManager.shared.isSoundOn ? .green : .red)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                    .padding()


                    VStack {
                        NavigationLink(destination: changePasswordView()) {
                            Text("Change Password")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                .font(.system(size: 18, weight: .bold)) .foregroundColor(.black)
                        }.padding()
                        
                        Button(action: {
                            viewModel.logOut()
                            isActive.toggle()
                        }) {
                            Text("Logout")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                .font(.system(size: 18, weight: .bold)) .foregroundColor(.black)
                        }
                    }

                    


                                
                    
                }
                
            }
            

        }
        }
}

#Preview {
    settingsView(audioManager: AudioManager())
}
