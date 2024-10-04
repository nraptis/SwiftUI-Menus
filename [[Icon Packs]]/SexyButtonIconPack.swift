//
//  SexyButtonIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

struct SexyButtonIconPack: TextIconPackable {
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        
        if numberOfLines == 2 {
            
            if Device.isPad {
                if isDarkMode {
                    if isEnabled {
                        return slicePadDark2Lines
                    } else {
                        return slicePadDarkDisabled2Lines
                    }
                } else {
                    if isEnabled {
                        return slicePadLight2Lines
                    } else {
                        return slicePadLightDisabled2Lines
                    }
                }
            } else {
                if orientation.isLandscape {
                    if isDarkMode {
                        if isEnabled {
                            return slicePhoneLandscapeDark2Lines
                        } else {
                            return slicePhoneLandscapeDarkDisabled2Lines
                        }
                    } else {
                        if isEnabled {
                            return slicePhoneLandscapeLight2Lines
                        } else {
                            return slicePhoneLandscapeLightDisabled2Lines
                        }
                    }
                } else {
                    if isDarkMode {
                        if isEnabled {
                            return slicePhonePortraitDark2Lines
                        } else {
                            return slicePhonePortraitDarkDisabled2Lines
                        }
                    } else {
                        if isEnabled {
                            return slicePhonePortraitLight2Lines
                        } else {
                            return slicePhonePortraitLightDisabled2Lines
                        }
                    }
                }
            }
        } else {
            if Device.isPad {
                if isDarkMode {
                    if isEnabled {
                        return slicePadDark1Line
                    } else {
                        return slicePadDarkDisabled1Line
                    }
                } else {
                    if isEnabled {
                        return slicePadLight1Line
                    } else {
                        return slicePadLightDisabled1Line
                    }
                }
            } else {
                if orientation.isLandscape {
                    if isDarkMode {
                        if isEnabled {
                            return slicePhoneLandscapeDark1Line
                        } else {
                            return slicePhoneLandscapeDarkDisabled1Line
                        }
                    } else {
                        if isEnabled {
                            return slicePhoneLandscapeLight1Line
                        } else {
                            return slicePhoneLandscapeLightDisabled1Line
                        }
                    }
                } else {
                    if isDarkMode {
                        if isEnabled {
                            return slicePhonePortraitDark1Line
                        } else {
                            return slicePhonePortraitDarkDisabled1Line
                        }
                    } else {
                        if isEnabled {
                            return slicePhonePortraitLight1Line
                        } else {
                            return slicePhonePortraitLightDisabled1Line
                        }
                    }
                }
            }
        }
    }
    
    let slicePadDark1Line: AnyTextIcon
    let slicePadLight1Line: AnyTextIcon
    let slicePhoneLandscapeDark1Line: AnyTextIcon
    let slicePhoneLandscapeLight1Line: AnyTextIcon
    let slicePhonePortraitDark1Line: AnyTextIcon
    let slicePhonePortraitLight1Line: AnyTextIcon
    let slicePadDark2Lines: AnyTextIcon
    let slicePadLight2Lines: AnyTextIcon
    let slicePhoneLandscapeDark2Lines: AnyTextIcon
    let slicePhoneLandscapeLight2Lines: AnyTextIcon
    let slicePhonePortraitDark2Lines: AnyTextIcon
    let slicePhonePortraitLight2Lines: AnyTextIcon
    let slicePadDarkDisabled1Line: AnyTextIcon
    let slicePadLightDisabled1Line: AnyTextIcon
    let slicePhoneLandscapeDarkDisabled1Line: AnyTextIcon
    let slicePhoneLandscapeLightDisabled1Line: AnyTextIcon
    let slicePhonePortraitDarkDisabled1Line: AnyTextIcon
    let slicePhonePortraitLightDisabled1Line: AnyTextIcon
    let slicePadDarkDisabled2Lines: AnyTextIcon
    let slicePadLightDisabled2Lines: AnyTextIcon
    let slicePhoneLandscapeDarkDisabled2Lines: AnyTextIcon
    let slicePhoneLandscapeLightDisabled2Lines: AnyTextIcon
    let slicePhonePortraitDarkDisabled2Lines: AnyTextIcon
    let slicePhonePortraitLightDisabled2Lines: AnyTextIcon
    
    init(slicePadDark1Line: AnyTextIcon,
         slicePadLight1Line: AnyTextIcon,
         slicePhoneLandscapeDark1Line: AnyTextIcon,
         slicePhoneLandscapeLight1Line: AnyTextIcon,
         slicePhonePortraitDark1Line: AnyTextIcon,
         slicePhonePortraitLight1Line: AnyTextIcon,
         
         slicePadDark2Lines: AnyTextIcon,
         slicePadLight2Lines: AnyTextIcon,
         slicePhoneLandscapeDark2Lines: AnyTextIcon,
         slicePhoneLandscapeLight2Lines: AnyTextIcon,
         slicePhonePortraitDark2Lines: AnyTextIcon,
         slicePhonePortraitLight2Lines: AnyTextIcon,
         
         slicePadDarkDisabled1Line: AnyTextIcon,
         slicePadLightDisabled1Line: AnyTextIcon,
         slicePhoneLandscapeDarkDisabled1Line: AnyTextIcon,
         slicePhoneLandscapeLightDisabled1Line: AnyTextIcon,
         slicePhonePortraitDarkDisabled1Line: AnyTextIcon,
         slicePhonePortraitLightDisabled1Line: AnyTextIcon,
         
         slicePadDarkDisabled2Lines: AnyTextIcon,
         slicePadLightDisabled2Lines: AnyTextIcon,
         slicePhoneLandscapeDarkDisabled2Lines: AnyTextIcon,
         slicePhoneLandscapeLightDisabled2Lines: AnyTextIcon,
         slicePhonePortraitDarkDisabled2Lines: AnyTextIcon,
         slicePhonePortraitLightDisabled2Lines: AnyTextIcon) {
        
        self.slicePadDark1Line = slicePadDark1Line
        self.slicePadLight1Line = slicePadLight1Line
        
        self.slicePhoneLandscapeDark1Line = slicePhoneLandscapeDark1Line
        self.slicePhoneLandscapeLight1Line = slicePhoneLandscapeLight1Line
        
        self.slicePhonePortraitDark1Line = slicePhonePortraitDark1Line
        self.slicePhonePortraitLight1Line = slicePhonePortraitLight1Line
        
        self.slicePadDark2Lines = slicePadDark2Lines
        self.slicePadLight2Lines = slicePadLight2Lines
        
        self.slicePhoneLandscapeDark2Lines = slicePhoneLandscapeDark2Lines
        self.slicePhoneLandscapeLight2Lines = slicePhoneLandscapeLight2Lines
        
        self.slicePhonePortraitDark2Lines = slicePhonePortraitDark2Lines
        self.slicePhonePortraitLight2Lines = slicePhonePortraitLight2Lines
        
        self.slicePadDarkDisabled1Line = slicePadDarkDisabled1Line
        self.slicePadLightDisabled1Line = slicePadLightDisabled1Line
        
        self.slicePhoneLandscapeDarkDisabled1Line = slicePhoneLandscapeDarkDisabled1Line
        self.slicePhoneLandscapeLightDisabled1Line = slicePhoneLandscapeLightDisabled1Line
        
        self.slicePhonePortraitDarkDisabled1Line = slicePhonePortraitDarkDisabled1Line
        self.slicePhonePortraitLightDisabled1Line = slicePhonePortraitLightDisabled1Line
        
        self.slicePadDarkDisabled2Lines = slicePadDarkDisabled2Lines
        self.slicePadLightDisabled2Lines = slicePadLightDisabled2Lines
        
        self.slicePhoneLandscapeDarkDisabled2Lines = slicePhoneLandscapeDarkDisabled2Lines
        self.slicePhoneLandscapeLightDisabled2Lines = slicePhoneLandscapeLightDisabled2Lines
        
        self.slicePhonePortraitDarkDisabled2Lines = slicePhonePortraitDarkDisabled2Lines
        self.slicePhonePortraitLightDisabled2Lines = slicePhonePortraitLightDisabled2Lines
    }
}
