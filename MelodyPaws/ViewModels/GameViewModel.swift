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
    

    func checkCollision(geometry: GeometryProxy, item: FallingItem, curY: CGFloat?) -> Bool {
        
        let charObjFrame = CGRect(x: charObj.position.width, y: charObj.position.height+charObj.size.height/2,
                                  width: charObj.size.width/2, height: charObj.size.height/2)
        let fallingItemFrame = CGRect(x: item.startX, y: curY ?? item.startY, width: item.size.width/2, height: item.size.height/2)

        return fallingItemFrame.intersects(charObjFrame)
    }
    
    func removeFallItem(item: FallingItem) {
        items.removeAll { $0.id == item.id }
    }
    
    func isCollision(index: Int){
        if (!items[index].isCollide){
            score += 1
            items[index].isCollide = true
        }
    }

    
}
