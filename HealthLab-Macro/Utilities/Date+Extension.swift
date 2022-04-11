//
//  Date+Extenstion.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 11/04/22.
//

import Foundation

extension Date {
    func getDateToString() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        return "\(day)/\(month)/\(year)"
    }
}
