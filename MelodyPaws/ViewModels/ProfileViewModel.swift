    //
    //  ProfileViewModel.swift
    //  MelodyPaws
    //
    //  Created by Babypowder on 1/5/2567 BE.
    //
     
    import Foundation
    import FirebaseAuth
    import FirebaseFirestore
    class ProfileViewModel: ObservableObject {
        @Published var user: User? = nil
        
        func fetchUser() {
            guard let userId = Auth.auth().currentUser?.uid else {
                return
            }
            let db = Firestore.firestore()
            db.collection("users")
                .document(userId).getDocument { [weak self] snapshot, error in
                    guard let data = snapshot?.data(), error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.user = User(
                            id: data["id"] as? String ?? "",
                            name: data["name"] as? String ?? "",
                            email: data["email"] as? String ?? "",
                            joined: data["joined"] as? TimeInterval ?? 0,
                            bestScore: data["bestScore"] as? Int ?? 0,
                            wearing: data["wearing"] as? String ?? "default-removebg-preview",
                            wardrobe: data["wardrobe"] as? [String] ?? ["default-removebg-preview","glasses-removebg-preview","cap-removebg-preview","HairClip-removebg-preview"]
     
                        )
                    }
                }
        }
        
        func logOut() {
            do {
                try Auth.auth().signOut()
            } catch {
                print(error)
            }
        }
        
        
        // Function to change the wearing for the current user
        func changeWearing(to newWearing: String) {
            guard let userId = Auth.auth().currentUser?.uid else {
                return
            }
            let db = Firestore.firestore()
            db.collection("users").document(userId).setData(["wearing": newWearing], merge: true) { [weak self] error in
                if let error = error {
                    print("Error updating wearing: \(error)")
                    return
                }
                DispatchQueue.main.async {
                    self?.user?.wearing = newWearing
                }
            }
        }
     
    }
