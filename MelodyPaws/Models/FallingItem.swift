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
    let size = CGSize(width: 50, height: 50)
    var imageName: String
    let startX: CGFloat
    let startY: CGFloat = 0
    let midY: CGFloat = UIScreen.main.bounds.height/2
    var currentY: CGFloat = 0
    var endY: CGFloat = UIScreen.main.bounds.height
    var speed: Double
    var isCollide: Bool = false
    var isActive: Bool = true
    
}
