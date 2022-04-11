//
//  Macro.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 04/04/22.
//

import Foundation

struct Macro: Decodable {
    var title: String
    var amount: String
    var indented: Bool
    var percentOfDailyNeeds: Double
}
