//
//  ToolInterfaceViewModel+SexyCheckBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyCheckBoxFlex(orientation: Orientation,
                                    configuration: ToolInterfaceElementSexyCheckBoxConfiguration,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        //let accentPack = configuration.accentPack
        
        let minimumWidthLarge = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                               iconPack: iconPack,
                                                                                                               orientation: orientation,
                                                                                                               flavor: .stackedLarge,
                                                                                                               squeeze: .squeezed,
                                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                                               neighborTypeRight: neighborTypeRight)
        let standardWidthLarge = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                                nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                iconPack: iconPack,
                                                                                                                orientation: orientation,
                                                                                                                flavor: .stackedLarge,
                                                                                                                squeeze: .standard,
                                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                                neighborTypeRight: neighborTypeRight)
        
        let minimumWidthMedium = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                                nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                iconPack: iconPack,
                                                                                                                orientation: orientation,
                                                                                                                flavor: .stackedMedium,
                                                                                                                squeeze: .squeezed,
                                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                                neighborTypeRight: neighborTypeRight)
        let standardWidthMedium = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                                 nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                 iconPack: iconPack,
                                                                                                                 orientation: orientation,
                                                                                                                 flavor: .stackedMedium,
                                                                                                                 squeeze: .standard,
                                                                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                                                                 neighborTypeRight: neighborTypeRight)
        
        let minimumWidthSmall = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                               iconPack: iconPack,
                                                                                                               orientation: orientation,
                                                                                                               flavor: .stackedSmall,
                                                                                                               squeeze: .squeezed,
                                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                                               neighborTypeRight: neighborTypeRight)
        let standardWidthSmall = SexyCheckBoxLayout.getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                                nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                                iconPack: iconPack,
                                                                                                                orientation: orientation,
                                                                                                                flavor: .stackedSmall,
                                                                                                                squeeze: .standard,
                                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                                neighborTypeRight: neighborTypeRight)
        
        let flexSexyCheckBox = FlexSexyCheckBoxData(minimumWidthLarge: minimumWidthLarge,
                                                    standardWidthLarge: standardWidthLarge,
                                                    maximumWidthLarge: standardWidthLarge,
                                                    
                                                    minimumWidthMedium: minimumWidthMedium,
                                                    standardWidthMedium: standardWidthMedium,
                                                    maximumWidthMedium: standardWidthMedium,
                                                    
                                                    minimumWidthSmall: minimumWidthSmall,
                                                    standardWidthSmall: standardWidthSmall,
                                                    maximumWidthSmall: standardWidthSmall)
        
        return ToolInterfaceElementFlex.sexyCheckBox(flexSexyCheckBox)
    }
}
