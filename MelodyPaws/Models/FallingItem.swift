//
//  FallingItem.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
import UIKit

struct FallingItem {
    let id = UUID()
    let size = CGSize(width: 100, height: 100)
    var imageName: String
    let startX: CGFloat
    let startY: CGFloat = 0
    var speed: Double
    var isCollide: Bool = false
    
}
