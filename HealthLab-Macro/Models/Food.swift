//
//  Food.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 04/04/22.
//

import Foundation

struct Food: Decodable {
    var id: Int
    var title: String
    var image: String
    
    init(id: Int, title: String, image: String) {
        self.id = id
        self.title = title
        self.image = image
    }
}

struct FoodResult: Decodable {
    var results: [Food]
    
    init() {
        results = []
    }
}
