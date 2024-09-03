//
//  ToolInterfaceViewModel+SexyButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyButtonFlex(orientation: Orientation,
                                  configuration: ToolInterfaceElementSexyButtonConfiguration,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        
        let minimumWidthLarge = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                  nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                  iconPack: iconPack,
                                                                                                  orientation: orientation,
                                                                                                  flavor: .stackedLarge,
                                                                                                  squeeze: .squeezed,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        let standardWidthLarge = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                   nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                   iconPack: iconPack,
                                                                                                   orientation: orientation,
                                                                                                   flavor: .stackedLarge,
                                                                                                   squeeze: .standard,
                                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                                   neighborTypeRight: neighborTypeRight)
        
        let minimumWidthMedium = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                   nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                   iconPack: iconPack,
                                                                                                   orientation: orientation,
                                                                                                   flavor: .stackedMedium,
                                                                                                   squeeze: .squeezed,
                                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                                   neighborTypeRight: neighborTypeRight)
        let standardWidthMedium = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                    nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                    iconPack: iconPack,
                                                                                                    orientation: orientation,
                                                                                                    flavor: .stackedMedium,
                                                                                                    squeeze: .standard,
                                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                                    neighborTypeRight: neighborTypeRight)
        
        let minimumWidthSmall = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                  nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                  iconPack: iconPack,
                                                                                                  orientation: orientation,
                                                                                                  flavor: .stackedSmall,
                                                                                                  squeeze: .squeezed,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        let standardWidthSmall = SexyButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                   nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                   iconPack: iconPack,
                                                                                                   orientation: orientation,
                                                                                                   flavor: .stackedSmall,
                                                                                                   squeeze: .standard,
                                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                                   neighborTypeRight: neighborTypeRight)
        
        let flexSexyButtonData = FlexSexyButtonData(minimumWidthLarge: minimumWidthLarge,
                                                    standardWidthLarge: standardWidthLarge,
                                                    maximumWidthLarge: standardWidthLarge,
                                                    
                                                    minimumWidthMedium: minimumWidthMedium,
                                                    standardWidthMedium: standardWidthMedium,
                                                    maximumWidthMedium: standardWidthMedium,
                                                    
                                                    minimumWidthSmall: minimumWidthSmall,
                                                    standardWidthSmall: standardWidthSmall,
                                                    maximumWidthSmall: standardWidthSmall)
        
        return ToolInterfaceElementFlex.sexyButton(flexSexyButtonData)
    }
}
