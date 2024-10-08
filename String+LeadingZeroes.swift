//
//  String+LeadingZeroes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/27/24.
//

import Foundation

extension String {
    static func fileNumberString(number: Int, leadingZeroes: Int) -> String {
        let numberString = String(number)
        let numberOfZeroes = (leadingZeroes - numberString.count)
        if numberOfZeroes > 0 {
            let zeroesArray = [Character](repeating: "0", count: numberOfZeroes)
            return String(zeroesArray) + numberString
        } else {
            return numberString
        }
    }
}
