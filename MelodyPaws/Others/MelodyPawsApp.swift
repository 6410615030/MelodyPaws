//
//  MelodyPawsApp.swift
//  MelodyPaws
//
//  Created by Babypowder on 28/4/2567 BE.
//

import SwiftUI
import FirebaseCore

@main
struct MelodyPawsApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
