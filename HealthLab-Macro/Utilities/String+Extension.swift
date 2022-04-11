//
//  String+Extension.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 11/04/22.
//

import Foundation

extension String {
    func removeAlphabets() -> String {
        return self.replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression)
    }
}
