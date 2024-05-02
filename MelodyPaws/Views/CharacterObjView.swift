//
//  CharacterObjViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import SwiftUI

struct CharacterObjView: View {
    let charObj: CharacterObj

    var body: some View {
        Image(charObj.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: charObj.size.width, height: charObj.size.height)
    }
}

#Preview {
    CharacterObjView(
        charObj: CharacterObj(imageName: "cat1")
    )
}
