//
//  ToolInterfaceElementType.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation
import UIKit

struct ToolInterfaceElementSexyCheckBoxConfiguration {
    
    let iconPack: MainTabIconPack
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int

    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    init(iconPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedLarge) + 2
        nameLabelWidthMedium = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                  line2: nameLabelLine2,
                                                                                  orientation: orientation,
                                                                                  flavor: .stackedMedium) + 2
        nameLabelWidthSmall = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
                                    isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementSexyStepperConfiguration {
    let iconPack: MainTabIconPack
    let incrementPack: MainTabIconPack
    let decrementPack: MainTabIconPack
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    let valueLabelWidthLarge: Int
    let valueLabelWidthMedium: Int
    let valueLabelWidthSmall: Int
    
    let minimumValue: Int
    let maximumValue: Int
    
    init(iconPack: MainTabIconPack,
         incrementPack: MainTabIconPack,
         decrementPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?,
         minimumValue: Int,
         maximumValue: Int) {
        
        self.iconPack = iconPack
        self.incrementPack = incrementPack
        self.decrementPack = decrementPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        var _nameLabelWidthLarge = SexyStepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedLarge) + 2
        
        var _nameLabelWidthMedium = SexyStepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                       line2: nameLabelLine2,
                                                                       orientation: orientation,
                                                                       flavor: .stackedMedium) + 2
        
        var _nameLabelWidthSmall = SexyStepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedSmall) + 2
        
        self.nameLabelWidthLarge = _nameLabelWidthLarge
        self.nameLabelWidthMedium = _nameLabelWidthMedium
        self.nameLabelWidthSmall = _nameLabelWidthSmall
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
        
        var wholeNumberCount = 1
        if maximumValue >= 10 { wholeNumberCount = max(wholeNumberCount, 2) }
        if minimumValue <= -1 { wholeNumberCount = max(wholeNumberCount, 2) }
        if minimumValue <= -10 { wholeNumberCount = max(wholeNumberCount, 3) }
        
        var exampleStringArray = [Character]()
        var exampleStringIndex = 0
        while exampleStringIndex < wholeNumberCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        let exampleString = String(exampleStringArray)
        
        valueLabelWidthLarge = SexyStepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedLarge) + 2
        valueLabelWidthMedium = SexyStepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                    orientation: orientation,
                                                                    flavor: .stackedMedium) + 2
        valueLabelWidthSmall = SexyStepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedSmall) + 2
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
        isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementEnterModeConfiguration {
    
    let iconPack: MainTabIconPack
    let accentPack: MainTabIconPack
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int

    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    init(iconPack: MainTabIconPack,
         accentPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        
        self.iconPack = iconPack
        self.accentPack = accentPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedLarge) + 2
        nameLabelWidthMedium = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                  line2: nameLabelLine2,
                                                                                  orientation: orientation,
                                                                                  flavor: .stackedMedium) + 2
        nameLabelWidthSmall = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
                                    isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementExitModeConfiguration {
    
    let iconPack: MainTabIconPack
    let accentPack: MainTabIconPack
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int

    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    init(iconPack: MainTabIconPack,
         accentPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        
        self.iconPack = iconPack
        self.accentPack = accentPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedLarge) + 2
        nameLabelWidthMedium = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                  line2: nameLabelLine2,
                                                                                  orientation: orientation,
                                                                                  flavor: .stackedMedium) + 2
        nameLabelWidthSmall = ExitModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
                                    isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementCheckBoxConfiguration {
    let iconPack: CheckBoxIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    //let iconWidthLong: Int
    //let iconHeightLong: Int
    //let iconWidthStacked: Int
    //let iconHeightStacked: Int
    
    init(iconPack: CheckBoxIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .long) + 2
        nameLabelWidthStackedLarge = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2,
                                                                          orientation: orientation,
                                                                          flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                           line2: nameLabelLine2,
                                                                           orientation: orientation,
                                                                           flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2,
                                                                          orientation: orientation,
                                                                          flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
        isEnabled: isEnabled)
    }
}

enum ToolInterfaceElementSliderWidthCategory {
    case fullWidth
    case stretch
    case halfWidthLeft // There may be a 1 pixel difference
    case halfWidthRight // There may be a 1 pixel difference
}

struct ToolInterfaceElementSliderConfiguration {
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    // The real text that we use...
    let realNameLabelWidthLarge: Int
    let realNameLabelWidthMedium: Int
    let realNameLabelWidthSmall: Int
    
    // For laying out groups of 2, 3, etc...
    // We are going to have them all "space out"
    // the same as the largest of the bunch...!!!
    let layoutNameLabelWidthLarge: Int
    let layoutNameLabelWidthMedium: Int
    let layoutNameLabelWidthSmall: Int
    
    let valueLabelWidthLarge: Int
    let valueLabelWidthMedium: Int
    let valueLabelWidthSmall: Int
    
    // For the slider itself, this is where we control max / min, etc
    let minimumValue: Float
    let maximumValue: Float
    let valueWholeNumberCount: Int
    let valueDecimalCount: Int
    
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    
    init(orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?,
         friend_1_nameLabelLine1: String?,
         friend_1_nameLabelLine2: String?,
         friend_2_nameLabelLine1: String?,
         friend_2_nameLabelLine2: String?,
         friend_3_nameLabelLine1: String?,
         friend_3_nameLabelLine2: String?,
         friend_4_nameLabelLine1: String?,
         friend_4_nameLabelLine2: String?,
         minimumValue: Float,
         maximumValue: Float,
         valueWholeNumberCount: Int,
         valueDecimalCount: Int,
         widthCategory: ToolInterfaceElementSliderWidthCategory
    ) {
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        var _nameLabelWidthLarge = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedLarge) + 2
        
        var _nameLabelWidthMedium = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                       line2: nameLabelLine2,
                                                                       orientation: orientation,
                                                                       flavor: .stackedMedium) + 2
        
        var _nameLabelWidthSmall = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedSmall) + 2
        
        self.realNameLabelWidthLarge = _nameLabelWidthLarge
        self.realNameLabelWidthMedium = _nameLabelWidthMedium
        self.realNameLabelWidthSmall = _nameLabelWidthSmall
        
        for friendIndex in 0...3 {
            
            var line1: String?
            var line2: String?
            if friendIndex == 0 {
                line1 = friend_1_nameLabelLine1
                line2 = friend_1_nameLabelLine2
            }
            if friendIndex == 1 {
                line1 = friend_2_nameLabelLine1
                line2 = friend_2_nameLabelLine2
            }
            if friendIndex == 2 {
                line1 = friend_3_nameLabelLine1
                line2 = friend_3_nameLabelLine2
            }
            if friendIndex == 3 {
                line1 = friend_4_nameLabelLine1
                line2 = friend_4_nameLabelLine2
            }
            if line1 != nil || line2 != nil {
                
                let _friendLabelWidthLarge = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                line2: line2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedLarge) + 2
                let _friendLabelWidthMedium = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                 line2: line2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedMedium) + 2
                let _friendLabelWidthSmall = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                line2: line2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedSmall) + 2
                
                if _friendLabelWidthLarge > _nameLabelWidthLarge {
                    _nameLabelWidthLarge = _friendLabelWidthLarge
                }
                if _friendLabelWidthMedium > _nameLabelWidthMedium {
                    _nameLabelWidthMedium = _friendLabelWidthMedium
                }
                if _friendLabelWidthSmall > _nameLabelWidthSmall {
                    _nameLabelWidthSmall = _friendLabelWidthSmall
                }
            }
        }
        
        self.layoutNameLabelWidthLarge = _nameLabelWidthLarge
        self.layoutNameLabelWidthMedium = _nameLabelWidthMedium
        self.layoutNameLabelWidthSmall = _nameLabelWidthSmall
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
        
        var exampleStringArray = [Character]()
        var exampleStringIndex = 0
        while exampleStringIndex < valueWholeNumberCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        exampleStringArray.append(".")
        exampleStringIndex = 0
        while exampleStringIndex < valueDecimalCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        
        let exampleString = String(exampleStringArray)
        
        valueLabelWidthLarge = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedLarge) + 2
        valueLabelWidthMedium = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                    orientation: orientation,
                                                                    flavor: .stackedMedium) + 2
        valueLabelWidthSmall = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedSmall) + 2
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.valueWholeNumberCount = valueWholeNumberCount
        self.valueDecimalCount = valueDecimalCount
        self.widthCategory = widthCategory
    }
}

struct ToolInterfaceElementTextIconButtonConfiguration {
    
    let iconPack: TextIconButtonIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    init(iconPack: TextIconButtonIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .long) + 2
        nameLabelWidthStackedLarge = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                line2: nameLabelLine2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                line2: nameLabelLine2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode, isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementSexyButtonConfiguration {
    
    let iconPack: LooseConvertibleIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    init(iconPack: LooseConvertibleIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = SexyButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                     line2: nameLabelLine2,
                                                                     orientation: orientation,
                                                                     flavor: .stackedLarge) + 2
        nameLabelWidthMedium = SexyButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedMedium) + 2
        nameLabelWidthSmall = SexyButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                     line2: nameLabelLine2,
                                                                     orientation: orientation,
                                                                     flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode, isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementSegmentedPickerButtonConfiguration {
    let id: UInt8
    let iconPack: FramedConvertibleIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    init(id: UInt8,
         iconPack: FramedConvertibleIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.id = id
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                         line2: nameLabelLine2,
                                                                         orientation: orientation,
                                                                         flavor: .long) + 2
        nameLabelWidthStackedLarge = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                  line2: nameLabelLine2,
                                                                                  orientation: orientation,
                                                                                  flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
        isEnabled: isEnabled)
    }
}

extension ToolInterfaceElementSegmentedPickerButtonConfiguration: Identifiable {
    
}

struct ToolInterfaceElementSegmentedPickerConfiguration {
    let buttonConfigurations: [ToolInterfaceElementSegmentedPickerButtonConfiguration]
}

struct ToolInterfaceElementMainTabButtonConfiguration {
    let id: UInt8
    let iconPack: MainTabIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    init(id: UInt8,
         iconPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.id = id
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = MainTabLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .stackedLarge) + 2
        nameLabelWidthMedium = MainTabLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                   line2: nameLabelLine2,
                                                                   orientation: orientation,
                                                                   flavor: .stackedMedium) + 2
        nameLabelWidthSmall = MainTabLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
                                    isEnabled: isEnabled)
    }
}

extension ToolInterfaceElementMainTabButtonConfiguration: Identifiable {
    
}

struct ToolInterfaceElementMainTabConfiguration {
    let buttonConfigurations: [ToolInterfaceElementMainTabButtonConfiguration]
}

struct ToolInterfaceElementCreateSwatchButtonConfiguration {
    let id: UInt8
    let iconPack: MainTabIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    
    init(id: UInt8,
         iconPack: MainTabIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.id = id
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        nameLabelWidthLarge = CreateSwatchLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .stackedLarge) + 2
        nameLabelWidthMedium = CreateSwatchLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                   line2: nameLabelLine2,
                                                                   orientation: orientation,
                                                                   flavor: .stackedMedium) + 2
        nameLabelWidthSmall = CreateSwatchLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .stackedSmall) + 2
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
                                    isEnabled: isEnabled)
    }
}

extension ToolInterfaceElementCreateSwatchButtonConfiguration: Identifiable {
    
}

struct ToolInterfaceElementCreateSwatchConfiguration {
    let buttonConfigurations: [ToolInterfaceElementCreateSwatchButtonConfiguration]
}

struct ToolInterfaceElementIconButtonConfiguration {
    let iconPack: TextIconButtonIconPack
    //let iconWidth: Int
    init(iconPack: TextIconButtonIconPack,
         orientation: Orientation) {
        self.iconPack = iconPack
        /*
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: .long,
                                        numberOfLines: 1)
        */
        //self.iconWidth = icon.iconWidth
    }
    
    func getTextIcon(orientation: Orientation, 
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: .long,
                                    numberOfLines: 1,
                                    isDarkMode: isDarkMode,
        isEnabled: isEnabled)
    }
    
}

struct ToolInterfaceElementGreenButtonConfiguration {
    
    let iconPack: GreenButtonIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidth: Int
    init(iconPack: GreenButtonIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidth = GreenButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                 line2: nameLabelLine2,
                                                                 orientation: orientation,
                                                                 flavor: .long) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     isDarkMode: Bool,
                     isEnabled: Bool) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines,
                                    isDarkMode: isDarkMode,
        isEnabled: isEnabled)
    }
}

struct ToolInterfaceElementFavoringOneLineLabelConfiguration {
    
    let oneLineText: String
    let oneLineWidth: Int
    
    let twoLineText1: String
    let twoLineText2: String
    let twoLineWidth: Int
    
    init(orientation: Orientation,
         text: String) {
        
        oneLineText = text
        oneLineWidth = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: text,
                                                                        orientation: orientation,
                                                                        flavor: .long)
        let words = text.split(separator: " ")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { $0.count > 0 }
        if words.count <= 1 {
            twoLineText1 = text
            twoLineText2 = ""
            twoLineWidth = oneLineWidth
        } else {
            
            var bestFirstLine = [String]()
            var bestSecondLine = [String]()
            bestFirstLine.append(words[0])
            var index = 1
            while index < words.count {
                bestSecondLine.append(words[index])
                index += 1
            }
            var bestJoined1 = bestFirstLine.joined(separator: " ")
            var bestJoined2 = bestSecondLine.joined(separator: " ")
            var bestWidth1 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: bestJoined1,
                                                                              orientation: orientation,
                                                                              flavor: .long)
            var bestWidth2 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: bestJoined2,
                                                                              orientation: orientation,
                                                                              flavor: .long)
            var bestWidth = max(bestWidth1, bestWidth2)
            var possibleSplit = 2
            let ceiling = words.count
            while possibleSplit < ceiling {
                var firstLine = [String]()
                var secondLine = [String]()
                var index = 0
                while index < possibleSplit {
                    firstLine.append(words[index])
                    index += 1
                }
                while index < words.count {
                    secondLine.append(words[index])
                    index += 1
                }
                var joined1 = firstLine.joined(separator: " ")
                var joined2 = secondLine.joined(separator: " ")
                var width1 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: joined1,
                                                                              orientation: orientation,
                                                                              flavor: .long)
                var width2 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: joined2,
                                                                              orientation: orientation,
                                                                              flavor: .long)
                var width = max(width1, width2)
                if width < bestWidth {
                    bestWidth = width
                    bestJoined1 = joined1
                    bestJoined2 = joined2
                }
                possibleSplit += 1
            }
            
            twoLineText1 = bestJoined1
            twoLineText2 = bestJoined2
            twoLineWidth = bestWidth
        }
    }
}
