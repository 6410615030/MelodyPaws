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

    var body: some View {
        Form {
            SecureField("New Password", text: $newPassword)
                .onChange(of: newPassword) { _ in
                    checkPasswordsMatch()
                }

            SecureField("Confirm Password", text: $confirmPassword)
                .onChange(of: confirmPassword) { _ in
                    checkPasswordsMatch()
                }

            if !passwordsMatch {
                Text("Passwords do not match.")
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button("Change Password") {
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
            }

            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Change Password")
    }

    private func checkPasswordsMatch() {
        passwordsMatch = newPassword == confirmPassword
    }
}



#Preview {
    changePasswordView()
}
