//
//  ToolInterfaceViewModel+ExitMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getExitModeFlex(orientation: Orientation,
                                configuration: ToolInterfaceElementExitModeConfiguration,
                                neighborTypeLeft: ToolInterfaceElementType?,
                                neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let accentPack = configuration.accentPack
        
        let minimumWidthLarge = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                         nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                         iconPack: iconPack,
                                                                                                         accentPack: accentPack,
                                                                                                         orientation: orientation,
                                                                                                         flavor: .stackedLarge,
                                                                                                         squeeze: .squeezed,
                                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                                         neighborTypeRight: neighborTypeRight)
        let standardWidthLarge = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                          nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                          iconPack: iconPack,
                                                                                                          accentPack: accentPack,
                                                                                                          orientation: orientation,
                                                                                                          flavor: .stackedLarge,
                                                                                                          squeeze: .standard,
                                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                                          neighborTypeRight: neighborTypeRight)
        
        let minimumWidthMedium = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                          nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                          iconPack: iconPack,
                                                                                                          accentPack: accentPack,
                                                                                                          orientation: orientation,
                                                                                                          flavor: .stackedMedium,
                                                                                                          squeeze: .squeezed,
                                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                                          neighborTypeRight: neighborTypeRight)
        let standardWidthMedium = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                           iconPack: iconPack,
                                                                                                           accentPack: accentPack,
                                                                                                           orientation: orientation,
                                                                                                           flavor: .stackedMedium,
                                                                                                           squeeze: .standard,
                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                           neighborTypeRight: neighborTypeRight)
        
        let minimumWidthSmall = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                         nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                         iconPack: iconPack,
                                                                                                         accentPack: accentPack,
                                                                                                         orientation: orientation,
                                                                                                         flavor: .stackedSmall,
                                                                                                         squeeze: .squeezed,
                                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                                         neighborTypeRight: neighborTypeRight)
        let standardWidthSmall = ExitModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                          nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                          iconPack: iconPack,
                                                                                                          accentPack: accentPack,
                                                                                                          orientation: orientation,
                                                                                                          flavor: .stackedSmall,
                                                                                                          squeeze: .standard,
                                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                                          neighborTypeRight: neighborTypeRight)
        
        let flexExitModeData = FlexExitModeData(minimumWidthLarge: minimumWidthLarge,
                                                standardWidthLarge: standardWidthLarge,
                                                maximumWidthLarge: standardWidthLarge,
                                                
                                                minimumWidthMedium: minimumWidthMedium,
                                                standardWidthMedium: standardWidthMedium,
                                                maximumWidthMedium: standardWidthMedium,
                                                
                                                minimumWidthSmall: minimumWidthSmall,
                                                standardWidthSmall: standardWidthSmall,
                                                maximumWidthSmall: standardWidthSmall)
        
        return ToolInterfaceElementFlex.exitMode(flexExitModeData)
    }
}
