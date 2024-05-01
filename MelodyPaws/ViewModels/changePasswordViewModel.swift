//
//  changePasswordViewModel.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 1/5/2567 BE.
//

import FirebaseAuth

class changePasswordViewModel: ObservableObject {
    
    func changePassword(newPassword: String, completion: @escaping (Bool, String?) -> Void) {
        
        guard let user = Auth.auth().currentUser else {
            completion(false, "User is not logged in.")
            return
        }
        
    
        user.updatePassword(to: newPassword) { error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
    }
}
