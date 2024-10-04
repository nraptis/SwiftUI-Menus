//
//  FramedLongIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

struct FramedLongIconPack: TextIconPackable {
    
    let planePad_0: IconPlane
    let planePhoneLandscape_0: IconPlane
    let planePhonePortrait_0: IconPlane
    
    init(planePad_0: IconPlane,
         planePhoneLandscape_0: IconPlane,
         planePhonePortrait_0: IconPlane) {
        self.planePad_0 = planePad_0
        self.planePhoneLandscape_0 = planePhoneLandscape_0
        self.planePhonePortrait_0 = planePhonePortrait_0
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        if Device.isPad {
            return planePad_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
        } else {
            if orientation.isLandscape {
                return planePhoneLandscape_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
            } else {
                return planePhonePortrait_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
            }
        }
    }
}
