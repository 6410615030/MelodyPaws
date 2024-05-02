//
//  CharacterObj.swift
//  MelodyPaws
//
//  Created by Babypowder on 2/5/2567 BE.
//

import Foundation
import UIKit

struct CharacterObj {
    let size = CGSize(width: 100, height: 100)
    var imageName: String
    var position: CGSize = CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height-200)
}
