//
//  GreenButtonIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

struct GreenButtonIconPack: TextIconPackable {
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        if Device.isPad {
            return slicePad0Lines
            
        } else {
            if orientation.isLandscape {
                return slicePhoneLandscape0Lines
            } else {
                return slicePhonePortrait0Lines
            }
        }
    }
    
    let slicePad0Lines: AnyTextIcon
    let slicePhoneLandscape0Lines: AnyTextIcon
    let slicePhonePortrait0Lines: AnyTextIcon
    init(slicePad0Lines: AnyTextIcon,
         slicePhoneLandscape0Lines: AnyTextIcon,
         slicePhonePortrait0Lines: AnyTextIcon) {
        self.slicePad0Lines = slicePad0Lines
        self.slicePhoneLandscape0Lines = slicePhoneLandscape0Lines
        self.slicePhonePortrait0Lines = slicePhonePortrait0Lines
    }
}
