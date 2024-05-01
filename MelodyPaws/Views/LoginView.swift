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
                    .navigationBarHidden(true)
                
                VStack {Spacer()
                        .frame(height: 200)
                                    List {
                                        TextField("Email Address", text: $viewModel.email)
                                            .textFieldStyle(DefaultTextFieldStyle())
                                            .autocorrectionDisabled()
                                            .autocapitalization(.none)
                                                                                    SecureField("Password", text: $viewModel.password)
                                            .textFieldStyle(DefaultTextFieldStyle())
                                            
                                        
                                        TLButton(title: "Log In", background: .blue) {
                                            viewModel.login()
                                        }
                                        .listRowBackground(Color.clear)
                                    }
                                    .listStyle(PlainListStyle())
                                    .background(Color.clear) 
                                
                    VStack {
                        Text("New Around Here")
                        NavigationLink("Create an Account", destination: RegisterView())
                    }
                    
                }
                
            }
            

        }
        
    }
}

#Preview {
    LoginView()
}
