//
//  Wardrobe.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import SwiftUI

struct Wardrobe: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        List {
            if let wardrobeItems = viewModel.user?.wardrobe {
                ForEach(wardrobeItems, id: \.self) { item in
                    HStack {
                        Spacer()
                        Image(item)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200,alignment: .center)
                        Spacer()
                    }
                    .onTapGesture {
                        viewModel.changeWearing(to: item)
                    }
                }
            } else {
                Text("No items in wardrobe.")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
        .navigationTitle("Wardrobe")
    }
}

#Preview {
    Wardrobe()
}
