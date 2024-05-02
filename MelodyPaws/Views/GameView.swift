//
//  GameView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI
import UIKit


struct GameView: View {
    @StateObject private var viewModel = GameViewModel(count: 1)
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                
                FallingItemView(items: viewModel.items, geometry: geometry, viewModel: viewModel)
                
                
                Image(viewModel.charObj.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: viewModel.charObj.size.width, height: viewModel.charObj.size.height)
                        .position(x: viewModel.charObj.position.width, y: viewModel.charObj.position.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    viewModel.charObj.position.width = value.location.x
                                }
                        )
                        .transaction { transaction in
                            transaction.animation = nil
                        }
                
                                VStack{
                    Text("score: \(viewModel.score)")
                }
                .transaction { transaction in
                    transaction.animation = nil
                }
            }
        }
    }
}

struct FallingItemView: View{
    @State private var posY: CGFloat = -50
    var items: [FallingItem]
    @State private var timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    let geometry: GeometryProxy
    let viewModel: GameViewModel
    @State private var isEndGame = false
    
    @State private var currentYPositions: [UUID: CGFloat] = [:]
    
    init(items: [FallingItem], geometry: GeometryProxy, viewModel: GameViewModel) {
        self.items = items
        self.geometry = geometry
        self.viewModel = viewModel
        
        for item in items {
            currentYPositions[item.id] = item.startY
        }
    }
    
    var body: some View{
        if !isEndGame {
            ZStack {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: item.size.width, height: item.size.height)
                        .position(x: item.startX, y: currentYPositions[item.id, default: item.startY])
                        .onReceive(timer) { _ in
                            withAnimation {
                                let updatedPosY = (currentYPositions[item.id] ?? item.startY) + 5
                                currentYPositions[item.id] = updatedPosY
                                if (viewModel.checkCollision(geometry: geometry, item: item, curY: currentYPositions[item.id])) {
                                    viewModel.isCollision(index: index)
                                }
                                if updatedPosY > geometry.size.height + 200 {
                                    isEndGame = true
                                }
                            }
                        }
                        .opacity(item.isCollide ? 0 : 1)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        else {
            EndGameView(score: viewModel.score)
        }
    }
    
}

#Preview {
    GameView()
}
