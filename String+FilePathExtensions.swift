//
//  String+FilePathExtensions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/13/23.
//

import Foundation

extension String {
    
    func fileExtension() -> String? {
        let array = Array(self)
        var index = array.count - 1
        while index >= 0 {
            if array[index] == "." { break }
            index -= 1
        }
        if index == -1 {
            return nil
        } else {
            return String(array[index..<array.count])
        }
    }
    
    
}
