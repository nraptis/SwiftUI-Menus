//
//  TextIconPackable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

enum TextIconDevice {
    case pad
    case phone
}

protocol TextIconPackable {
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable)
}

struct BlankTextIconPack: TextIconPackable {
    let icon = BlankTextIcon()
    func getTextIcon(orientation: Orientation, layoutSchemeFlavor: LayoutSchemeFlavor, numberOfLines: Int, isDarkMode: Bool, isEnabled: Bool) -> (any TextIconable) {
        return icon
    }
}
