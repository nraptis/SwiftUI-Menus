//
//  ToolInterfaceElementType.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import UIKit

struct ToolInterfaceElementStepperConfiguration {
    let iconPack: FramedConvertibleIconPack
    let incrementPack: FramedLongIconPack
    let decrementPack: FramedLongIconPack
    
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    
    let valueLabelWidthLarge: Int
    let valueLabelWidthMedium: Int
    let valueLabelWidthSmall: Int
    
    let minimumValue: Int
    let maximumValue: Int
    
    init(iconPack: FramedConvertibleIconPack,
         incrementPack: FramedLongIconPack,
         decrementPack: FramedLongIconPack,
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
        nameLabelWidthLong = StepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                line2: nameLabelLine2,
                                                                orientation: orientation,
                                                                flavor: .long) + 2
        nameLabelWidthStackedLarge = StepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = StepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                         line2: nameLabelLine2,
                                                                         orientation: orientation,
                                                                         flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = StepperLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
        
        var wholeNumberCount = 1
        
        if maximumValue >= 10000 { wholeNumberCount = max(wholeNumberCount, 5) }
        if maximumValue >= 1000 { wholeNumberCount = max(wholeNumberCount, 4) }
        if maximumValue >= 100 { wholeNumberCount = max(wholeNumberCount, 3) }
        if maximumValue >= 10 { wholeNumberCount = max(wholeNumberCount, 2) }
        if minimumValue <= -1 { wholeNumberCount = max(wholeNumberCount, 2) }
        if minimumValue <= -10 { wholeNumberCount = max(wholeNumberCount, 3) }
        if minimumValue <= -100 { wholeNumberCount = max(wholeNumberCount, 4) }
        if minimumValue <= -1000 { wholeNumberCount = max(wholeNumberCount, 5) }
        if minimumValue <= -10000 { wholeNumberCount = max(wholeNumberCount, 6) }
        
        var exampleStringArray = [Character]()
        var exampleStringIndex = 0
        while exampleStringIndex < wholeNumberCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        let exampleString = String(exampleStringArray)
        
        valueLabelWidthLarge = StepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedLarge) + 2
        valueLabelWidthMedium = StepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                    orientation: orientation,
                                                                    flavor: .stackedMedium) + 2
        valueLabelWidthSmall = StepperLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedSmall) + 2
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        
    }
}

struct ToolInterfaceElementCreateSwatchButtonConfiguration: Identifiable {
    let id: UInt8
    let iconPack: FramedLongIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    init(id: UInt8,
         iconPack: FramedLongIconPack,
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
}

struct ToolInterfaceElementCreateSwatchConfiguration {
    let buttonConfigurations: [ToolInterfaceElementCreateSwatchButtonConfiguration]
}

struct ToolInterfaceElementMainTabButtonConfiguration: Identifiable {
    let id: UInt8
    let iconPack: FramedLongIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    init(id: UInt8,
         iconPack: FramedLongIconPack,
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
}

struct ToolInterfaceElementMainTabConfiguration {
    let buttonConfigurations: [ToolInterfaceElementMainTabButtonConfiguration]
}



struct ToolInterfaceElementSegmentedPickerButtonConfiguration: Identifiable {
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
}

struct ToolInterfaceElementSegmentedPickerConfiguration {
    let buttonConfigurations: [ToolInterfaceElementSegmentedPickerButtonConfiguration]
}



struct ToolInterfaceElementGreenButtonConfiguration {
    let iconPack: FramedLongIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    init(iconPack: FramedLongIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLarge = GreenButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedLarge) + 2
        nameLabelWidthMedium = GreenButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                       line2: nameLabelLine2,
                                                                       orientation: orientation,
                                                                       flavor: .stackedMedium) + 2
        nameLabelWidthSmall = GreenButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
}

struct ToolInterfaceElementChangeModeConfiguration {
    let iconPack: FramedConvertibleIconPack
    let accentPack: FramedLongIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    init(iconPack: FramedConvertibleIconPack,
         accentPack: FramedLongIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.accentPack = accentPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
            //TODO: This is both...
        nameLabelWidthLong = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                line2: nameLabelLine2,
                                                                orientation: orientation,
                                                                flavor: .long) + 2
        nameLabelWidthStackedLarge = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                         line2: nameLabelLine2,
                                                                         orientation: orientation,
                                                                         flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = EnterModeLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }

}

struct ToolInterfaceElementCheckBoxConfiguration {
    let iconPack: FramedConvertibleIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    init(iconPack: FramedConvertibleIconPack,
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

}

enum ToolInterfaceElementSliderWidthCategory: UInt8 {
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

struct ToolInterfaceElementButtonConfiguration {
    let iconPack: LooseConvertibleIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    init(iconPack: LooseConvertibleIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = ButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                line2: nameLabelLine2,
                                                                orientation: orientation,
                                                                flavor: .long) + 2
        nameLabelWidthStackedLarge = ButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = ButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                         line2: nameLabelLine2,
                                                                         orientation: orientation,
                                                                         flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = ButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .stackedSmall) + 2
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
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
            let bestWidth1 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: bestJoined1,
                                                                              orientation: orientation,
                                                                              flavor: .long)
            let bestWidth2 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: bestJoined2,
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
                let joined1 = firstLine.joined(separator: " ")
                let joined2 = secondLine.joined(separator: " ")
                let width1 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: joined1,
                                                                              orientation: orientation,
                                                                              flavor: .long)
                let width2 = FavoringOneLineLabelLayout.getNameLabelTextWidth(line1: joined2,
                                                                              orientation: orientation,
                                                                              flavor: .long)
                let width = max(width1, width2)
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
