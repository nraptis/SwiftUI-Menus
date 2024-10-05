//
//  ToolInterfaceViewModel+GreenButtons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getGreenButtonFlex(orientation: Orientation,
                                   configuration: ToolInterfaceElementGreenButtonConfiguration,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let minimumWidth = GreenButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidth,
                                                                                              nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                              iconPack: iconPack,
                                                                                              orientation: orientation,
                                                                                              flavor: .long,
                                                                                              squeeze: .squeezed,
                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                              neighborTypeRight: neighborTypeRight)
        
        let standardWidth = GreenButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidth,
                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        let flexGreenButtonData = FlexGreenButtonData(minimumWidth: minimumWidth,
                                                      standardWidth: standardWidth,
                                                      relaxedWidth: standardWidth)
        
        return ToolInterfaceElementFlex.greenButton(flexGreenButtonData)
    }
    
}
