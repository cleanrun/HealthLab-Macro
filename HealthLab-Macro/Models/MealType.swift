//
//  Summary.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 08/04/22.
//

import Foundation

@objc
public enum MealType: Int32 {
    case Breakfast = 0
    case Brunch = 1
    case Lunch = 2
    case Dinner = 3
    case Snack = 4
    
    func getStringRawValue() -> String {
        switch self {
        case .Breakfast:
            return "Breakfast"
        case .Brunch:
            return "Brunch"
        case .Lunch:
            return "Lunch"
        case .Dinner:
            return "Dinner"
        case .Snack:
            return "Snack"
        }
    }
}
