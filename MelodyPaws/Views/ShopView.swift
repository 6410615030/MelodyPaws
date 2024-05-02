//
//  ShopView.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import SwiftUI

struct ShopView: View {
    @StateObject var viewModel = ShopViewModel()
    var body: some View {
            VStack {
                List(viewModel.shop, id: \.imageName) { item in
                    VStack(alignment: .leading) {
                        Image("\(item.imageName)")
                            .resizable()
                                                    .aspectRatio(contentMode: .fit) 
                                                    .frame(height: 100)
                        Text("Item: \(item.imageName)")
                        Text("Price: $\(item.price)")
                    }
                }
                .padding()
            }
        }
}

#Preview {
    ShopView()
}
