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
        ZStack{
            Image("gameOver")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
//                Text("Score").font(.system(size: 35, weight: .bold)) .foregroundColor(.black)
//                Text("\(score)").font(.system(size: 35, weight: .bold)) .foregroundColor(.black)
                Text("Score: \(score)").font(.system(size: 35, weight: .bold)) .foregroundColor(.black)
                
                
                NavigationLink(destination: ProfileView()) {
                    HStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 120, height: 120)
                            .overlay(Image(systemName: "house.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100))
                        
                    }
                    .padding()
                }
                
            }
        }
    }
}

#Preview {
    EndGameView(score: 0)
}
