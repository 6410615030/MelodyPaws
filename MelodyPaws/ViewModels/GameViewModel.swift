//
//  GameViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var items: [FallingItem] = []
    @Published var charObj = CharacterObj(imageName: "cat1")
    @Published var score: Int = 0
    private let itemImgNames = ["butterfly"]
    private var timer: AnyCancellable?
    private var startTime: Date?
    private var interval: TimeInterval = 1.0
    
    init(count: Int) {
        initialItems(count: count)
        startAddingItems()
    }
    
    private func initialItems(count: Int) {
        items = (0..<count).map { _ in
            FallingItem(
                imageName: itemImgNames.randomElement() ?? "defaultImage",
                startX: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                speed: Double.random(in: 0...1)
            )
        }
    }

    private func startAddingItems() {
        startTime = Date()
        timer = Timer.publish(every: interval, on: .main, in: .common).autoconnect()
            .sink { [weak self] _ in
                self?.addNewItem()
                self?.adjustTimerInterval()
            }
    }

    private func addNewItem() {
        let newItem = FallingItem(
            imageName: itemImgNames.randomElement() ?? "defaultImage",
            startX: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            speed: Double.random(in: 2...5)
        )
        items.append(newItem)
    }

    private func adjustTimerInterval() {
        guard let start = startTime else { return }
        let elapsed = Date().timeIntervalSince(start)
        if elapsed < 60 {
            interval = max(0.2, 1 - (elapsed / 60))
            timer?.cancel() // Cancel the current timer
            timer = Timer.publish(every: interval, on: .main, in: .common).autoconnect()
                .sink { [weak self] _ in
                    self?.addNewItem()
                    self?.adjustTimerInterval()
                }
        }
    }
    
    func checkCollisions(posX: CGFloat, posY: CGFloat) {
        let collisionThreshold: CGFloat = 10
        var toRemoveItems: [FallingItem] = []

        for i in items.indices {
            let distanceX = abs(posX - items[i].startX)
            if distanceX <= collisionThreshold{
                score += 1
//                toRemoveItems.append(items[i])
                items[i].atPos = true
            }
            else {
                items[i].atPos = false
            }
            if items[i].currentY == items[i].endY {
                toRemoveItems.append(items[i])
            }
        }
        
        for i in toRemoveItems.indices {
            removeFallItem(item: toRemoveItems[i])
        }
        
        toRemoveItems.forEach { removeFallItem(item: $0) }
    }

    func removeFallItem(item: FallingItem) {
        items.removeAll { $0.id == item.id }
    }
    
//    func updatePositions() {
//        for item in items {
//            let deltaY = (item.endY - item.startY) / CGFloat(item.speed) * 0.016  // For smoother animation
//            let newCurrentY = item.currentY + deltaY
//            if newCurrentY >= item.midY && !item.atPos {
//                item.atPos = true
//            }
//
//            if newCurrentY >= item.endY {
//                item.currentY = item.endY
//            } else {
//                item.currentY = newCurrentY
//            }
//        }
//    }
//    

    
}
