//
//  IconPlane.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

class IconPlane {
    
    let numberOfLines: Int
    let device: TextIconDevice
    let orientation: Orientation
    let iconDark: AnyTextIcon
    let iconDarkDisabled: AnyTextIcon?
    let iconLight: AnyTextIcon
    let iconLightDisabled: AnyTextIcon?
    let width: Int
    let height: Int
    
    init(numberOfLines: Int,
         device: TextIconDevice,
         orientation: Orientation,
         iconDark: AnyTextIcon,
         iconDarkDisabled: AnyTextIcon?,
         iconLight: AnyTextIcon,
         iconLightDisabled: AnyTextIcon?,
         width: Int,
         height: Int) {
        self.numberOfLines = numberOfLines
        self.device = device
        self.orientation = orientation
        self.iconDark = iconDark
        self.iconDarkDisabled = iconDarkDisabled
        self.iconLight = iconLight
        self.iconLightDisabled = iconLightDisabled
        self.width = width
        self.height = height
    }
    
    convenience init(numberOfLines: Int,
                     device: TextIconDevice,
                     orientation: Orientation,
                     prefix: String,
                     name: String,
                     width: Int,
                     height: Int) {
        
        var namePieces = [String]()
        if !prefix.isEmpty { namePieces.append(prefix) }
        namePieces.append(name)
        switch device {
        case .pad:
            namePieces.append("pad_\(numberOfLines)l")
        case .phone:
            switch orientation {
            case .landscape:
                namePieces.append("phone_ls_\(numberOfLines)l")
            case .portrait:
                namePieces.append("phone_po_\(numberOfLines)l")
            }
        }
        
        let partialFileName = namePieces.joined(separator: "_")
        
        let iconDark = AnyTextIcon(fileName: partialFileName + "_dark",
                                   device: device,
                                   orientation: orientation,
                                   width: width,
                                   height: height)
        let iconDarkDisabled = AnyTextIcon(fileName: partialFileName + "_dark_disabled",
                                           device: device,
                                           orientation: orientation,
                                           width: width,
                                           height: height)
        let iconLight = AnyTextIcon(fileName: partialFileName + "_light",
                                    device: device,
                                    orientation: orientation,
                                    width: width,
                                    height: height)
        let iconLightDisabled = AnyTextIcon(fileName: partialFileName + "_light_disabled",
                                            device: device,
                                            orientation: orientation,
                                            width: width,
                                            height: height)
        self.init(numberOfLines: numberOfLines,
                  device: device,
                  orientation: orientation,
                  iconDark: iconDark,
                  iconDarkDisabled: iconDarkDisabled,
                  iconLight: iconLight,
                  iconLightDisabled: iconLightDisabled,
                  width: width,
                  height: height)
    }
    
    func getTextIcon(isDarkMode: Bool,
                     isEnabled: Bool) -> (any TextIconable) {
        if isDarkMode {
            if isEnabled == false {
                if let result = iconDarkDisabled {
                    return result
                } else {
                    return iconDark
                }
            } else {
                return iconDark
            }
        } else {
            if isEnabled == false {
                if let result = iconLightDisabled {
                    return result
                } else {
                    return iconLight
                }
            } else {
                return iconLight
            }
        }
    }
}
