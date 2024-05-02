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
    var startX: CGFloat
    let startY: CGFloat = 0
    let midY: CGFloat = UIScreen.main.bounds.height/2
    var currentY: CGFloat = 0
    var endY: CGFloat = UIScreen.main.bounds.height
    var speed: Double
    var atPos: Bool = false
}
//class FallingItem: Identifiable, ObservableObject {
//    let id = UUID()
//    var imageName: String
//    var startX: CGFloat
//    var startY: CGFloat = 0
//    var midY: CGFloat = UIScreen.main.bounds.height/2
//    var endY: CGFloat = UIScreen.main.bounds.height
//    var speed: Double
//    var size: CGSize = CGSize(width: 50, height: 50)
//    @Published var atPos: Bool = false  // Make sure to notify views about changes
//
//    init(imageName: String, startX: CGFloat, speed: Double) {
//        self.imageName = imageName
//        self.speed = speed
//        self.startX = startX
//    }
//}
