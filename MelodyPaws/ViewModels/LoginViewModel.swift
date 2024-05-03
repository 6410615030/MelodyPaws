    //
    //  LoginViewModel.swift
    //  MelodyPaws
    //
    //  Created by Babypowder on 1/5/2567 BE.
    //
     
    import Foundation
    import FirebaseAuth
     
    class LoginViewModel: ObservableObject {
        @Published var email = ""
        @Published var password = ""
        @Published var isLoggedIn = false // Use this to track login state
     
        func login(completion: @escaping (Bool) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Login failed: \(error)")
                        completion(false)
                    } else {
                        print("Login successful")
                        self?.isLoggedIn = true // Update the login state
                        completion(true)
                    }
                }
            }
        }
        func logOut() {
                do {
                    try Auth.auth().signOut()
                    isLoggedIn = false
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            }
    }
