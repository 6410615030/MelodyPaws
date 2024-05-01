//
//  HomeView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        @StateObject var viewModel = HomeViewModel()
        VStack {
            if !viewModel.isSignedIn, viewModel.currentUserId.isEmpty {
                LoginView()
            } else {
                
                Text("home")
            }
        }
    }
}

#Preview {
    HomeView()
}
