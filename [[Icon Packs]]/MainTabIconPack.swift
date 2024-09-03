//
//  MainTabIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

struct MainTabIconPack: TextIconPackable {
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        if Device.isPad {
            if isDarkMode {
                if isEnabled {
                    return slicePadDark
                } else {
                    return slicePadDarkDisabled
                }
            } else {
                if isEnabled {
                    return slicePadLight
                } else {
                    return slicePadLightDisabled
                }
            }
        } else {
            if orientation.isLandscape {
                if isDarkMode {
                    if isEnabled {
                        return slicePhoneLandscapeDark
                    } else {
                        return slicePhoneLandscapeDarkDisabled
                    }
                } else {
                    if isEnabled {
                        return slicePhoneLandscapeLight
                    } else {
                        return slicePhoneLandscapeLightDisabled
                    }
                }
            } else {
                if isDarkMode {
                    if isEnabled {
                        return slicePhonePortraitDark
                    } else {
                        return slicePhonePortraitDarkDisabled
                    }
                } else {
                    if isEnabled {
                        return slicePhonePortraitLight
                    } else {
                        return slicePhonePortraitLightDisabled
                    }
                }
            }
        }
    }
    
    let slicePadDark: AnyTextIcon
    let slicePadLight: AnyTextIcon
    let slicePhoneLandscapeDark: AnyTextIcon
    let slicePhoneLandscapeLight: AnyTextIcon
    let slicePhonePortraitDark: AnyTextIcon
    let slicePhonePortraitLight: AnyTextIcon
    
    let slicePadDarkDisabled: AnyTextIcon
    let slicePadLightDisabled: AnyTextIcon
    let slicePhoneLandscapeDarkDisabled: AnyTextIcon
    let slicePhoneLandscapeLightDisabled: AnyTextIcon
    let slicePhonePortraitDarkDisabled: AnyTextIcon
    let slicePhonePortraitLightDisabled: AnyTextIcon
    
    init(slicePadDark: AnyTextIcon,
         slicePadLight: AnyTextIcon,
         slicePhoneLandscapeDark: AnyTextIcon,
         slicePhoneLandscapeLight: AnyTextIcon,
         
         slicePhonePortraitDark: AnyTextIcon,
         slicePhonePortraitLight: AnyTextIcon,
         slicePadDarkDisabled: AnyTextIcon,
         
         slicePadLightDisabled: AnyTextIcon,
         slicePhoneLandscapeDarkDisabled: AnyTextIcon,
         slicePhoneLandscapeLightDisabled: AnyTextIcon,
          
         slicePhonePortraitDarkDisabled: AnyTextIcon,
         slicePhonePortraitLightDisabled: AnyTextIcon) {
        
        self.slicePadDark = slicePadDark
        self.slicePadLight = slicePadLight
        
        self.slicePhoneLandscapeDark = slicePhoneLandscapeDark
        self.slicePhoneLandscapeLight = slicePhoneLandscapeLight
        
        self.slicePhonePortraitDark = slicePhonePortraitDark
        self.slicePhonePortraitLight = slicePhonePortraitLight
        
        self.slicePadDarkDisabled = slicePadDarkDisabled
        self.slicePadLightDisabled = slicePadLightDisabled
        
        self.slicePhoneLandscapeDarkDisabled = slicePhoneLandscapeDarkDisabled
        self.slicePhoneLandscapeLightDisabled = slicePhoneLandscapeLightDisabled
        
        
        self.slicePhonePortraitDarkDisabled = slicePhonePortraitDarkDisabled
        self.slicePhonePortraitLightDisabled = slicePhonePortraitLightDisabled
    }
}
