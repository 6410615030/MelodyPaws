//
//  EndGameView.swift
//  MelodyPaws
//
//  Created by Babypowder on 3/5/2567 BE.
//

import SwiftUI

struct EndGameView: View {
    @StateObject var viewModel = EndGameViewModel()
    var score: Int

    var body: some View {
        VStack{
            Text("Game Over")
            Text("Score")
            Text("\(score)")
//            NavigationLink(destination: GameView(charObj: viewModel.charObj)) {
//                Image(systemName: "arrowshap_turnup_left_circle_fill")
//            }
//            NavigationLink(destination: HomeView()) {
//                Image(systemName: "house_circle_fill")
//            }
        }
    }
}

#Preview {
    EndGameView(score: 0)
}
