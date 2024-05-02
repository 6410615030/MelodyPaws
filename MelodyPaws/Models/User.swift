//
//  User.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    var bestScore: Int = 0
    var wearing: String = "default-removebg-preview"
    var wardrobe: [String] = ["default-removebg-preview","glasses-removebg-preview","cap-removebg-preview","HairClip-removebg-preview"]
}
