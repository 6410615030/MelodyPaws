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
    var coins: Int = 0
}
