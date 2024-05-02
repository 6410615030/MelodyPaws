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
        ZStack{
            FallingItemsView(items: viewModel.items)
            CharacterObjView(charObj: viewModel.charObj)
<<<<<<< Updated upstream
=======
//                .position(x: viewModel.charObj.position.width, y: viewModel.charObj.position.height)
>>>>>>> Stashed changes
                .position(x: viewModel.charObj.position.width, y: viewModel.charObj.position.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewModel.charObj.position.width = value.location.x
                            viewModel.checkCollisions(posX: value.location.x, posY: value.location.y)
                        }
                )
                .transaction { transaction in
                    transaction.animation = nil
                }
            VStack{
                Text("score: \(viewModel.score)")
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: UIScreen.main.bounds.width, height: 10)
                    .position(x: 200, y: 500)
                
            }
            .transaction { transaction in
                transaction.animation = nil
            }
        }
    }
}

#Preview {
    GameView()
}
