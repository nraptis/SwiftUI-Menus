//
//  ToolInterfaceFactory.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

@MainActor final class ToolInterfaceFactory {
    
    static func getDividerTinyFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        ToolInterfaceElementFlex.fixed(DividerLayout.getPillWidthTiny(orientation: orientation))
    }
    
    static func getDividerHugeFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        ToolInterfaceElementFlex.fixed(DividerLayout.getPillWidthHuge(orientation: orientation))
    }
    
    static func getDividerSpacerDividerFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        let minimumWidth = DividerLayout.getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: orientation)
        let standardWidth = minimumWidth + (Device.isPad ? 8 : 4)
        let flexDividerSpacerDividerData = FlexDividerSpacerDividerData(minimumWidth: minimumWidth,
                                                                        standardWidth: standardWidth)
        return ToolInterfaceElementFlex.dividerSpacerDivider(flexDividerSpacerDividerData)
    }
    
    static func getButtonFlex(orientation: Orientation,
                              configuration: ToolInterfaceElementButtonConfiguration,
                              neighborTypeLeft: ToolInterfaceElementType?,
                              neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let iconPackTertiary = ApplicationController.isPurchased ? FramedLongIconLibrary.uncoloredLock : nil
        
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: ButtonLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: nil,
                                                     iconPackTertiary: iconPackTertiary,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: 0,
                                                     valueLabelWidthMedium: 0,
                                                     valueLabelWidthSmall: 0,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.button(flexConvertibleData)
    }
    
    static func getCheckBoxFlex(orientation: Orientation,
                                configuration: ToolInterfaceElementCheckBoxConfiguration,
                                neighborTypeLeft: ToolInterfaceElementType?,
                                neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: CheckBoxLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                                     iconPackTertiary: nil,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: 0,
                                                     valueLabelWidthMedium: 0,
                                                     valueLabelWidthSmall: 0,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.checkBox(flexConvertibleData)
    }
    
    static func getSegmentFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementSegmentedPickerConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let infoList = configuration.buttonConfigurations.map {
            SEGMENT_FLEX_INFO_CONVERTIBLE(iconPackMain: $0.iconPack,
                                          iconPackSecondary: nil,//FramedLongIconLibrary.checkBoxSquare,
                                          iconPackTertiary: nil,//FramedLongIconLibrary.testArrowRight,
                                          nameLabelWidthLong: $0.nameLabelWidthLong,
                                          nameLabelWidthStackedLarge: $0.nameLabelWidthStackedLarge,
                                          nameLabelWidthStackedMedium: $0.nameLabelWidthStackedMedium,
                                          nameLabelWidthStackedSmall: $0.nameLabelWidthStackedSmall,
                                          numberOfLines: $0.nameLabelNumberOfLines)
        }
        
        let flexConvertibleData = getConvertibleSegmentFlex(orientation: orientation,
                                                            scheme: SegmentedPickerLayout.self,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight,
                                                            attemptEqualWidthsForAllButtons: true,
                                                            infoList: infoList)
        return .segment(flexConvertibleData)
    }
    
    static func getSliderFlex(orientation: Orientation,
                              configuration: ToolInterfaceElementSliderConfiguration,
                              neighborTypeLeft: ToolInterfaceElementType?,
                              neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let extraWidthStandard = SliderLayout.getExtraWidthStandard(orientation: orientation)
        let extraWidthRelaxed = SliderLayout.getExtraWidthRelaxed(orientation: orientation)
        let widthCategory = configuration.widthCategory
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch)
        let flexLongData = getLongFlex(orientation: orientation,
                                       scheme: SliderLayout.self,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight,
                                       iconPackMain: ApplicationController.blankTextIconPack,
                                       iconPackSecondary: nil,
                                       iconPackTertiary: nil,
                                       nameLabelWidthLarge: configuration.layoutNameLabelWidthLarge,
                                       nameLabelWidthMedium: configuration.layoutNameLabelWidthMedium,
                                       nameLabelWidthSmall: configuration.layoutNameLabelWidthSmall,
                                       numberOfLines: configuration.nameLabelNumberOfLines,
                                       valueLabelWidthLarge: configuration.valueLabelWidthLarge,
                                       valueLabelWidthMedium: configuration.valueLabelWidthMedium,
                                       valueLabelWidthSmall: configuration.valueLabelWidthSmall,
                                       extraWidthSqueezed: preferredMinimumBarWidth,
                                       extraWidthStandard: preferredMinimumBarWidth + extraWidthStandard,
                                       extraWidthRelaxed: preferredMinimumBarWidth + extraWidthRelaxed)
        
        return ToolInterfaceElementFlex.slider(flexLongData, widthCategory)
    }
    
    static func getCreateSwatchFlex(orientation: Orientation,
                                    configuration: ToolInterfaceElementCreateSwatchConfiguration,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let infoList = configuration.buttonConfigurations.map {
            SEGMENT_FLEX_INFO_LONG(iconPackMain: $0.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil,
                                   nameLabelWidthLarge: $0.nameLabelWidthLarge,
                                   nameLabelWidthMedium: $0.nameLabelWidthMedium,
                                   nameLabelWidthSmall: $0.nameLabelWidthSmall,
                                   numberOfLines: $0.nameLabelNumberOfLines)
        }
        
        let flexLongData = getLongSegmentFlex(orientation: orientation,
                                              scheme: CreateSwatchLayout.self,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight,
                                              attemptEqualWidthsForAllButtons: true,
                                              infoList: infoList)
        return .createSwatch(flexLongData)
    }
    
    static func getMainTabFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementMainTabConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let infoList = configuration.buttonConfigurations.map {
            SEGMENT_FLEX_INFO_LONG(iconPackMain: $0.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil,
                                   nameLabelWidthLarge: $0.nameLabelWidthLarge,
                                   nameLabelWidthMedium: $0.nameLabelWidthMedium,
                                   nameLabelWidthSmall: $0.nameLabelWidthSmall,
                                   numberOfLines: $0.nameLabelNumberOfLines)
        }
        
        let flexLongData = getLongSegmentFlex(orientation: orientation,
                                              scheme: MainTabLayout.self,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight,
                                              attemptEqualWidthsForAllButtons: true,
                                              infoList: infoList)
        return .mainTab(flexLongData)
    }
    
    static func getStepperFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementStepperConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: StepperLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: configuration.incrementPack,
                                                     iconPackTertiary: configuration.decrementPack,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: configuration.valueLabelWidthLarge,
                                                     valueLabelWidthMedium: configuration.valueLabelWidthMedium,
                                                     valueLabelWidthSmall: configuration.valueLabelWidthSmall,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.stepper(flexConvertibleData)
    }
    
    static func getEnterModeFlex(orientation: Orientation,
                                 configuration: ToolInterfaceElementChangeModeConfiguration,
                                 neighborTypeLeft: ToolInterfaceElementType?,
                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: EnterModeLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: configuration.accentPack,
                                                     iconPackTertiary: nil,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: 0,
                                                     valueLabelWidthMedium: 0,
                                                     valueLabelWidthSmall: 0,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.enterMode(flexConvertibleData)
    }
    
    static func getExitModeFlex(orientation: Orientation,
                                configuration: ToolInterfaceElementChangeModeConfiguration,
                                neighborTypeLeft: ToolInterfaceElementType?,
                                neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: ExitModeLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: configuration.accentPack,
                                                     iconPackTertiary: nil,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: 0,
                                                     valueLabelWidthMedium: 0,
                                                     valueLabelWidthSmall: 0,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.exitMode(flexConvertibleData)
    }
    
    static func getGreenButtonFlex(orientation: Orientation,
                                   configuration: ToolInterfaceElementGreenButtonConfiguration,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexLongData = getLongFlex(orientation: orientation,
                                       scheme: GreenButtonLayout.self,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight,
                                       iconPackMain: configuration.iconPack,
                                       iconPackSecondary: nil,
                                       iconPackTertiary: nil,
                                       nameLabelWidthLarge: configuration.nameLabelWidthLarge,
                                       nameLabelWidthMedium: configuration.nameLabelWidthMedium,
                                       nameLabelWidthSmall: configuration.nameLabelWidthSmall,
                                       numberOfLines: configuration.nameLabelNumberOfLines,
                                       valueLabelWidthLarge: 0,
                                       valueLabelWidthMedium: 0,
                                       valueLabelWidthSmall: 0,
                                       extraWidthSqueezed: 0,
                                       extraWidthStandard: 0,
                                       extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.greenButton(flexLongData)
    }
    
    static func getFavoringOneLineLabelFlex(orientation: Orientation,
                                            configuration: ToolInterfaceElementFavoringOneLineLabelConfiguration,
                                            minimumWidth: Int,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let outsideBoxLeftSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                         squeeze: .squeezed,
                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                         neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                         squeeze: .standard,
                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                         neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                        squeeze: .relaxed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                           squeeze: .squeezed,
                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                           neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                           squeeze: .standard,
                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                           neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                          squeeze: .relaxed,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        let paddingSqueezed = outsideBoxLeftSqueezed + outsideBoxRightSqueezed
        let paddingStandard = outsideBoxLeftStandard + outsideBoxRightStandard
        let paddingRelaxed = outsideBoxLeftRelaxed + outsideBoxRightRelaxed
        
        var squeezedOneLineWidth = configuration.oneLineWidth + paddingSqueezed
        var standardOneLineWidth = configuration.oneLineWidth + paddingStandard
        var relaxedOneLineWidth = configuration.oneLineWidth + paddingRelaxed
        
        var squeezedTwoLineWidth = configuration.twoLineWidth + paddingSqueezed
        var standardTwoLineWidth = configuration.twoLineWidth + paddingStandard
        var relaxedTwoLineWidth = configuration.twoLineWidth + paddingRelaxed
        
        if squeezedOneLineWidth < minimumWidth { squeezedOneLineWidth = minimumWidth }
        if standardOneLineWidth < minimumWidth { standardOneLineWidth = minimumWidth }
        if relaxedOneLineWidth < minimumWidth { relaxedOneLineWidth = minimumWidth }
        
        if squeezedTwoLineWidth < minimumWidth { squeezedTwoLineWidth = minimumWidth }
        if standardTwoLineWidth < minimumWidth { standardTwoLineWidth = minimumWidth }
        if relaxedTwoLineWidth < minimumWidth { relaxedTwoLineWidth = minimumWidth }
        
        let flexFavoringOneLineLabelData = FlexFavoringOneLineLabelData(squeezedOneLineWidth: squeezedOneLineWidth,
                                                                        standardOneLineWidth: standardOneLineWidth,
                                                                        relaxedOneLineWidth: relaxedOneLineWidth,
                                                                        squeezedTwoLineWidth: squeezedTwoLineWidth,
                                                                        standardTwoLineWidth: standardTwoLineWidth,
                                                                        relaxedTwoLineWidth: relaxedTwoLineWidth)
        return ToolInterfaceElementFlex.favoringOneLineLabel(flexFavoringOneLineLabelData)
    }
}
