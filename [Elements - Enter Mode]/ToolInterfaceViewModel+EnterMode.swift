//
//  ToolInterfaceViewModel+EnterMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getEnterModeFlex(orientation: Orientation,
                                 configuration: ToolInterfaceElementEnterModeConfiguration,
                                 neighborTypeLeft: ToolInterfaceElementType?,
                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let accentPack = configuration.accentPack
        
        let minimumWidthLarge = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                          nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                          iconPack: iconPack,
                                                                                                          accentPack: accentPack,
                                                                                                          orientation: orientation,
                                                                                                          flavor: .stackedLarge,
                                                                                                          squeeze: .squeezed,
                                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                                          neighborTypeRight: neighborTypeRight)
        let standardWidthLarge = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLarge,
                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                           iconPack: iconPack,
                                                                                                           accentPack: accentPack,
                                                                                                           orientation: orientation,
                                                                                                           flavor: .stackedLarge,
                                                                                                           squeeze: .standard,
                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                           neighborTypeRight: neighborTypeRight)
        
        let minimumWidthMedium = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                           iconPack: iconPack,
                                                                                                           accentPack: accentPack,
                                                                                                           orientation: orientation,
                                                                                                           flavor: .stackedMedium,
                                                                                                           squeeze: .squeezed,
                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                           neighborTypeRight: neighborTypeRight)
        let standardWidthMedium = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthMedium,
                                                                                                            nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                            iconPack: iconPack,
                                                                                                            accentPack: accentPack,
                                                                                                            orientation: orientation,
                                                                                                            flavor: .stackedMedium,
                                                                                                            squeeze: .standard,
                                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                                            neighborTypeRight: neighborTypeRight)
        
        let minimumWidthSmall = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                          nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                          iconPack: iconPack,
                                                                                                          accentPack: accentPack,
                                                                                                          orientation: orientation,
                                                                                                          flavor: .stackedSmall,
                                                                                                          squeeze: .squeezed,
                                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                                          neighborTypeRight: neighborTypeRight)
        let standardWidthSmall = EnterModeLayout.getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthSmall,
                                                                                                           nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                           iconPack: iconPack,
                                                                                                           accentPack: accentPack,
                                                                                                           orientation: orientation,
                                                                                                           flavor: .stackedSmall,
                                                                                                           squeeze: .standard,
                                                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                                                           neighborTypeRight: neighborTypeRight)
        
        let flexEnterModeData = FlexEnterModeData(minimumWidthLarge: minimumWidthLarge,
                                                  standardWidthLarge: standardWidthLarge,
                                                  maximumWidthLarge: standardWidthLarge,
                                                  
                                                  minimumWidthMedium: minimumWidthMedium,
                                                  standardWidthMedium: standardWidthMedium,
                                                  maximumWidthMedium: standardWidthMedium,
                                                  
                                                  minimumWidthSmall: minimumWidthSmall,
                                                  standardWidthSmall: standardWidthSmall,
                                                  maximumWidthSmall: standardWidthSmall)
        
        return ToolInterfaceElementFlex.enterMode(flexEnterModeData)
    }
}
