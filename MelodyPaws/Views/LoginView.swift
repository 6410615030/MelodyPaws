//
//  LoginView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("newLogin")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack {
                    Spacer()
                        .frame(height: 200)
                    List {
                        VStack(spacing: 20) {
                            TextField("Email Address", text: $viewModel.email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocorrectionDisabled()
                                .autocapitalization(.none)

                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(30)
                                
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                            
                            TLButton(title: "Log In", background: .black) {
                                viewModel.login()
                            }
                            
                            .cornerRadius(30)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)

                                
                    VStack {
                        
                        NavigationLink(destination: RegisterView()) {
                                Text("Register Here!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.pink)
                                    .textCase(.uppercase)
                                    .cornerRadius(30)
                            }
                    }
                    
                }
                
            }
            

        }
        
    }
}

#Preview {
    LoginView()
}
