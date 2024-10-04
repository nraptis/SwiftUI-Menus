//
//  LooseConvertibleIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

struct LooseConvertibleIconPack: TextIconPackable {
    
    let planePad_0: IconPlane
    let planePhoneLandscape_0: IconPlane
    let planePhonePortrait_0: IconPlane
    
    let planePad_1: IconPlane
    let planePhoneLandscape_1: IconPlane
    let planePhonePortrait_1: IconPlane
    
    let planePad_2: IconPlane
    let planePhoneLandscape_2: IconPlane
    let planePhonePortrait_2: IconPlane
    
    init(planePad_0: IconPlane,
         planePhoneLandscape_0: IconPlane,
         planePhonePortrait_0: IconPlane,
         
         planePad_1: IconPlane,
         planePhoneLandscape_1: IconPlane,
         planePhonePortrait_1: IconPlane,
         
         planePad_2: IconPlane,
         planePhoneLandscape_2: IconPlane,
         planePhonePortrait_2: IconPlane
    ) {
        self.planePad_0 = planePad_0
        self.planePhoneLandscape_0 = planePhoneLandscape_0
        self.planePhonePortrait_0 = planePhonePortrait_0
        
        self.planePad_1 = planePad_1
        self.planePhoneLandscape_1 = planePhoneLandscape_1
        self.planePhonePortrait_1 = planePhonePortrait_1
        
        self.planePad_2 = planePad_2
        self.planePhoneLandscape_2 = planePhoneLandscape_2
        self.planePhonePortrait_2 = planePhonePortrait_2
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        
        switch layoutSchemeFlavor {
        case .long:
            if Device.isPad {
                return planePad_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
            } else {
                if orientation.isLandscape {
                    return planePhoneLandscape_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                } else {
                    return planePhonePortrait_0.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                }
            }
        default:
            if numberOfLines >= 2 {
                if Device.isPad {
                    return planePad_2.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                } else {
                    if orientation.isLandscape {
                        return planePhoneLandscape_2.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                    } else {
                        return planePhonePortrait_2.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                    }
                }
            } else {
                if Device.isPad {
                    return planePad_1.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                } else {
                    if orientation.isLandscape {
                        return planePhoneLandscape_1.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                    } else {
                        return planePhonePortrait_1.getTextIcon(isDarkMode: isDarkMode, isEnabled: isEnabled)
                    }
                }
            }
        }
    }
}
