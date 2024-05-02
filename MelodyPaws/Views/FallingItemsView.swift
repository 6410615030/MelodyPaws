//
//  FallingItemView.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct FallingItemsView: View {
    var items: [FallingItem]
    @State private var currentYPositions: [UUID: CGFloat]
    
    init(items: [FallingItem]) {
        self.items = items
        _currentYPositions = State(initialValue: items.reduce(into: [:]) { result, item in
            result[item.id] = item.startY
        })
    }
    
    var body: some View {
        ZStack {
            ForEach(items, id: \.id) { item in
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: item.size.width, height: item.size.height)
                    .position(x: item.startX, y: currentYPositions[item.id, default: item.startY])
<<<<<<< Updated upstream
                    .onAppear {
                        withAnimation(Animation.linear(duration: item.speed)) {
                            currentYPositions[item.id] = item.endY
                        }
                    }
//                    .onChange(of: item.atPos) { newPos in
//                        withAnimation(.linear(duration: item.speed)) {
//                            if newPos {
//                                currentYPositions[item.id] = item.midY
//                            } else {
//                                currentYPositions[item.id] = item.endY
//                            }
//                        }
//                    }
=======
>>>>>>> Stashed changes
//                    .onAppear {
//                        withAnimation(Animation.linear(duration: item.speed)) {
//                            currentYPositions[item.id] = item.endY
//                        }
//                    }
<<<<<<< Updated upstream
=======
                    .onChange(of: item.atPos) { newPos in
                        withAnimation(.linear(duration: item.speed)) {
                            if newPos {
                                currentYPositions[item.id] = item.midY
                            } else {
                                currentYPositions[item.id] = item.endY
                            }
                        }
                    }
                    .onAppear {
                        withAnimation(Animation.linear(duration: item.speed)) {
                            currentYPositions[item.id] = item.endY
                        }
                    }
>>>>>>> Stashed changes
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    FallingItemsView(items: [])
}
