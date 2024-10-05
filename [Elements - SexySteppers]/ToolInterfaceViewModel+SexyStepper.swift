//
//  ToolInterfaceViewModel+SexyStepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation
import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyStepperFlex(orientation: Orientation,
                                   configuration: ToolInterfaceElementSexyStepperConfiguration,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let incrementPack = configuration.incrementPack
        let decrementPack = configuration.decrementPack
        
        
        var minimumWidthLarge = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                           iconPack: iconPack,
                                                                                                                           incrementPack: incrementPack,
                                                                                                                           decrementPack: decrementPack,
                                                                                                                           orientation: orientation,
                                                                                                                           flavor: .stackedLarge,
                                                                                                                           squeeze: .squeezed,
                                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                                           neighborTypeRight: neighborTypeRight)
        
        var standardWidthLarge = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                                            nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                            iconPack: iconPack,
                                                                                                                            incrementPack: incrementPack,
                                                                                                                            decrementPack: decrementPack,
                                                                                                                            orientation: orientation,
                                                                                                                            flavor: .stackedLarge,
                                                                                                                            squeeze: .standard,
                                                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                                                            neighborTypeRight: neighborTypeRight)
        
        var minimumWidthMedium = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                                            nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                            iconPack: iconPack,
                                                                                                                            incrementPack: incrementPack,
                                                                                                                            decrementPack: decrementPack,
                                                                                                                            orientation: orientation,
                                                                                                                            flavor: .stackedMedium,
                                                                                                                            squeeze: .squeezed,
                                                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                                                            neighborTypeRight: neighborTypeRight)
        
        var standardWidthMedium = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                                             nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                             iconPack: iconPack,
                                                                                                                             incrementPack: incrementPack,
                                                                                                                             decrementPack: decrementPack,
                                                                                                                             orientation: orientation,
                                                                                                                             flavor: .stackedMedium,
                                                                                                                             squeeze: .standard,
                                                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                                                             neighborTypeRight: neighborTypeRight)
        
        var minimumWidthSmall = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                           iconPack: iconPack,
                                                                                                                           incrementPack: incrementPack,
                                                                                                                           decrementPack: decrementPack,
                                                                                                                           orientation: orientation,
                                                                                                                           flavor: .stackedSmall,
                                                                                                                           squeeze: .squeezed,
                                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                                           neighborTypeRight: neighborTypeRight)
        var standardWidthSmall = SexyStepperLayout.getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                                            nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                            iconPack: iconPack,
                                                                                                                            incrementPack: incrementPack,
                                                                                                                            decrementPack: decrementPack,
                                                                                                                            orientation: orientation,
                                                                                                                            flavor: .stackedSmall,
                                                                                                                            squeeze: .standard,
                                                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                                                            neighborTypeRight: neighborTypeRight)
        
        minimumWidthSmall += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedSmall, squeeze: .squeezed)
        minimumWidthSmall += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedSmall, squeeze: .squeezed)
        minimumWidthSmall += configuration.valueLabelWidthSmall
        
        standardWidthSmall += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedSmall, squeeze: .standard)
        standardWidthSmall += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedSmall, squeeze: .standard)
        standardWidthSmall += configuration.valueLabelWidthSmall
        
        minimumWidthMedium += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedMedium, squeeze: .squeezed)
        minimumWidthMedium += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedMedium, squeeze: .squeezed)
        minimumWidthMedium += configuration.valueLabelWidthMedium
        
        standardWidthMedium += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedMedium, squeeze: .standard)
        standardWidthMedium += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedMedium, squeeze: .standard)
        standardWidthMedium += configuration.valueLabelWidthMedium
        
        minimumWidthLarge += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedLarge, squeeze: .squeezed)
        minimumWidthLarge += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedLarge, squeeze: .squeezed)
        minimumWidthLarge += configuration.valueLabelWidthLarge
        
        standardWidthLarge += SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation, flavor: .stackedLarge, squeeze: .standard)
        standardWidthLarge += SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation, flavor: .stackedLarge, squeeze: .standard)
        standardWidthLarge += configuration.valueLabelWidthLarge
        
        let flexSexyStepperData = FlexSexyStepperData(minimumWidthLarge: minimumWidthLarge,
                                                      standardWidthLarge: standardWidthLarge,
                                                      relaxedWidthLarge: standardWidthLarge,
                                                      
                                                      minimumWidthMedium: minimumWidthMedium,
                                                      standardWidthMedium: standardWidthMedium,
                                                      relaxedWidthMedium: standardWidthMedium,
                                                      
                                                      minimumWidthSmall: minimumWidthSmall,
                                                      standardWidthSmall: standardWidthSmall,
                                                      relaxedWidthSmall: standardWidthSmall)
        
        return ToolInterfaceElementFlex.sexyStepper(flexSexyStepperData)
        
    }
    
}

