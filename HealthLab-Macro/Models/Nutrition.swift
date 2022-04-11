//
//  Nutrition.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 04/04/22.
//

import Foundation

struct Nutrition: Decodable {
    var calories: String
    var carbs: String
    var fat: String
    var protein: String
    var bad: [Macro]
    var good: [Macro]
    var isStale: Bool
}
