//
//  Wardrobe.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import SwiftUI

struct Wardrobe: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        Image("\(viewModel.currentUser?.wearing ?? "default")").resizable()
            .aspectRatio(contentMode: .fit)
        .frame(width: 50, height: 50)

        
    }
}

#Preview {
    Wardrobe()
}
