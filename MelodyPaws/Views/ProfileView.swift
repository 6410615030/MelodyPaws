
     
    import SwiftUI
     
    struct ProfileView: View {
        @StateObject var viewModel = ProfileViewModel()
        @State private var isRecording = false
        @StateObject var tuneViewModel = AudioTuneViewModel()
        var body: some View {
            
            ZStack{
                
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                
                    VStack {
                        if let user = viewModel.user {
                        HStack {
                            
                            NavigationLink(destination: Wardrobe()) {
                                HStack {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 70, height: 70)
                                        .overlay(Image(systemName: "wand.and.stars")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                        )
                                    
                                }
                                .padding()
                            }
                            
                            NavigationLink(destination: settingsView(audioManager: AudioManager())) {
                                HStack {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 70, height: 70)
                                        .overlay(Image(systemName: "gearshape")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                        )
                                    
                                }
                                .padding()
                            }
                            
                            //                    Button(action: {
                            //                        viewModel.logOut()
                            //                    }) {
                            //                        Text("Logout")
                            //                            .padding()
                            //                            .background(Color.white)
                            //                            .cornerRadius(30)
                            //                            .font(.system(size: 18, weight: .bold)) .foregroundColor(.black)
                            //                    }
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
                            
//                            NavigationLink(destination: Wardrobe()) {
//                                HStack {
//                                    Circle()
//                                        .fill(Color.blue)
//                                        .frame(width: 30, height: 30)
//                                        .overlay(Image(systemName: "music.note").foregroundColor(.white))
//                                    
//                                }
//                                .padding()
//                            }
                            
                        }
                        //                    Text("Best Score : \(user.bestScore)") // Display the best score
                        //                                            .font(.title)
                        //                                            .padding()
                        Image("\(user.wearing)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                        VStack {
                            
                            NavigationLink(destination: GameView(wear: user.wearing)) {
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
                        
                        
                        
                        
                        Button(isRecording ? "Stop Recording" : "Start Recording") {
                            isRecording.toggle()
                            if isRecording {
                                tuneViewModel.startRecordingTapped()
                            } else {
                                tuneViewModel.stopRecordingTapped()
                            }
                        }
                    }else {
                        LoginView()
                    }
                    }
                    .onAppear {
                        viewModel.fetchUser()
                    }
                }
        }
    }
     
    #Preview {
        ProfileView()
    }
