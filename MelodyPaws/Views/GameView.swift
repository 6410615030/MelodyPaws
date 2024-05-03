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
    let wear: String
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack {
                    Text("Score: \(viewModel.score)")
                        .font(.system(size: 25, weight: .bold))
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(10)
                }
                FallingItemView(items: viewModel.items, geometry: geometry, viewModel: viewModel)
                
                
                Image("\(wear)")
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
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                
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
                                if updatedPosY > geometry.size.height + 100 && !item.isCollide{
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
    GameView(wear: "default-removebg-preview")
}
