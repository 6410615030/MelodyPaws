    //
    //  RegisterView.swift
    //  MelodyPaws
    //
    //  Created by Babypowder on 1/5/2567 BE.
    //
     
    import SwiftUI
     
    struct RegisterView: View {
        @StateObject var viewModel = RegisterViewModel()
        @State var isActive = false
        var body: some View {
    //        VStack {
    //            Form {
    //                TextField("Full Name", text: $viewModel.name)
    //                    .textFieldStyle(DefaultTextFieldStyle())
    //                TextField("Email Address", text: $viewModel.email)
    //                    .textFieldStyle(DefaultTextFieldStyle())
    //                    .autocorrectionDisabled()
    //                    .autocapitalization(.none)
    //                SecureField("Password", text: $viewModel.password)
    //                    .textFieldStyle(DefaultTextFieldStyle())
    //                TLButton(title: "Create Account", background: .green) {
    //                    viewModel.register()
    //                }
    //            }
    //            .offset(y: -50)
    //
    //            Spacer()
    //        }
            NavigationView {
                ZStack{
                    Image("register")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.all)
                        
                    
                    VStack {
                        Spacer()
                            .frame(height: 200)
                        List {
                            VStack {
                                
                                    TextField("Full Name", text: $viewModel.name)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(30)
                                        .foregroundColor(Color.black)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .autocorrectionDisabled()
                                        .autocapitalization(.none)
                                    TextField("Email Address", text: $viewModel.email)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(30)
                                        .foregroundColor(Color.black)
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
                                NavigationLink(destination: LoginView(), isActive: $isActive){
                                    EmptyView()
                                }
                                    TLButton(title: "Create Account", background: .black) {
                                        viewModel.register()
                                        isActive.toggle()
                                    }
                                    .cornerRadius(30)
                                if viewModel.isRegistered {
                                                        NavigationLink(destination: LoginView(), isActive: $viewModel.isRegistered) {
                                                            EmptyView()
                                                        }
                                                    }
                                
                               
                                
                                
                            }
                            .listRowBackground(Color.clear)
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.clear)
     
                                    
                       
                        
                    }
                    
                }
                
     
            }.navigationBarBackButtonHidden(true)
            
        }
    }
     
     
    #Preview {
        RegisterView()
    }
