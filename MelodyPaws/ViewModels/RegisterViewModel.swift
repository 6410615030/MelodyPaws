    //
    //  RegisterViewModel.swift
    //  MelodyPaws
    //
    //  Created by Babypowder on 1/5/2567 BE.
    //
     
    //import Foundation
    //import FirebaseAuth
    //import FirebaseFirestore
    //
    //class RegisterViewModel: ObservableObject {
    //    @Published var name = ""
    //    @Published var email = ""
    //    @Published var password = ""
    //    @Published var isRegistered = false
    //
    //    func register() {
    //        guard validate() else {
    //            return
    //        }
    //        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
    //            guard let userId = result?.user.uid else {
    //                return
    //            }
    //            self?.insertUserRecord(id: userId)
    //        }
    //
    //    }
    //    private func insertUserRecord(id: String) {
    //        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
    //        let db = Firestore.firestore()
    //        db.collection("users")
    //            .document(id)
    //            .setData(newUser.asDictionary())
    //    }
    //    private func validate() -> Bool {
    //        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
    //              !email.trimmingCharacters(in: .whitespaces).isEmpty,
    //              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
    //            return false
    //        }
    //        guard email.contains("@") && email.contains(".") else {
    //            return false
    //        }
    //        guard password.count >= 6 else {
    //            return false
    //        }
    //        return true
    //    }
    //}
     
    import Foundation
    import FirebaseAuth
    import FirebaseFirestore
     
    class RegisterViewModel: ObservableObject {
        @Published var name = ""
        @Published var email = ""
        @Published var password = ""
        @Published var isRegistered = false
        @Published var errorMessage: String?  // Optionally handle error messages
     
        func register() {
            guard validate() else {
                errorMessage = "Invalid input data. Please check your entries and try again."
                return
            }
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        return
                    }
                    guard let userId = result?.user.uid else {
                        self?.errorMessage = "Failed to retrieve user information after registration."
                        return
                    }
                    self?.insertUserRecord(id: userId)
                    self?.isRegistered = true  // Set to true upon successful registration and database entry
                }
            }
        }
        
        private func insertUserRecord(id: String) {
            let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
            let db = Firestore.firestore()
            db.collection("users").document(id).setData(newUser.asDictionary()) { [weak self] error in
                DispatchQueue.main.async {
                    if let error = error {
                        self?.errorMessage = "Failed to save user data: \(error.localizedDescription)"
                        self?.isRegistered = false
                    }
                }
            }
        }
        
        private func validate() -> Bool {
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                  !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                return false
            }
            guard email.contains("@") && email.contains(".") else {
                return false
            }
            guard password.count >= 6 else {
                return false
            }
            return true
        }
    }
