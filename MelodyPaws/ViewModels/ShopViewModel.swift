//
//  ShopViewModel.swift
//  MelodyPaws
//
//  Created by Phurinut Hirunsatitporn on 2/5/2567 BE.
//

import Foundation


class ShopViewModel: ObservableObject {
    
    struct ClothingItem {
        let imageName: String
        let price: Int
    }
    
    var shop: [ShopViewModel.ClothingItem] = [
        ShopViewModel.ClothingItem(imageName: "glasses", price: 10),
        ShopViewModel.ClothingItem(imageName: "cap", price: 5),
        ShopViewModel.ClothingItem(imageName: "HairClip", price: 15)
    ]
    
    
}
