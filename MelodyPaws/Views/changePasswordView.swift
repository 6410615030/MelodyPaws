//
//  changePasswordView.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 1/5/2567 BE.
//

import SwiftUI

struct changePasswordView: View {
    @StateObject var viewModel = changePasswordViewModel()
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var message: String = ""
    @State private var passwordsMatch: Bool = true
    private func checkPasswordsMatch() {
        passwordsMatch = newPassword == confirmPassword
    }

    var body: some View {
        NavigationView {
            ZStack{
                Image("changePassword")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack {
                    Spacer()
                        .frame(height: 200)
                    List {
                        VStack(spacing: 20) {
                            
                                SecureField("New Password", text: $newPassword)
                                    .onChange(of: newPassword) { _ in
                                        checkPasswordsMatch()
                                    }.padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                SecureField("Confirm Password", text: $confirmPassword)
                                    .onChange(of: confirmPassword) { _ in
                                        checkPasswordsMatch()
                                    }.padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                if !passwordsMatch {
                                    Text("Passwords do not match.")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            Button(action: {
                                if passwordsMatch {
                                    viewModel.changePassword(newPassword: newPassword) { success, error in
                                        if success {
                                            message = "Password successfully changed!"
                                            newPassword = ""
                                            confirmPassword = ""
                                        } else {
                                            message = error ?? "An error occurred"
                                        }
                                    }
                                } else {
                                    message = "Passwords do not match."
                                }
                            }) {
                                Text("Change Password")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(30)
                            }

                                if !message.isEmpty {
                                    Text(message)
                                        .foregroundColor(.red)
                                }
                            
                        }.listRowBackground(Color.clear)                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)

                                
                   
                    
                }
                
            }
            

        }
        
//        Form {
//            SecureField("New Password", text: $newPassword)
//                .onChange(of: newPassword) { _ in
//                    checkPasswordsMatch()
//                }
//            SecureField("Confirm Password", text: $confirmPassword)
//                .onChange(of: confirmPassword) { _ in
//                    checkPasswordsMatch()
//                }
//            if !passwordsMatch {
//                Text("Passwords do not match.")
//                    .foregroundColor(.red)
//                    .font(.caption)
//            }
//            Button("Change Password") {
//                if passwordsMatch {
//                    viewModel.changePassword(newPassword: newPassword) { success, error in
//                        if success {
//                            message = "Password successfully changed!"
//                            newPassword = ""
//                            confirmPassword = ""
//                        } else {
//                            message = error ?? "An error occurred"
//                        }
//                    }
//                } else {
//                    message = "Passwords do not match."
//                }
//            }
//            if !message.isEmpty {
//                Text(message)
//                    .foregroundColor(.red)
//            }
//        }
        
    }
   
    
}



#Preview {
    changePasswordView()
}
