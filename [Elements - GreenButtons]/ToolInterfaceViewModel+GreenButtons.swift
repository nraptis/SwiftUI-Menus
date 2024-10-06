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
        let flexLongData = getLongFlex(orientation: orientation,
                                       scheme: GreenButtonLayout.self,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight,
                                       iconPackMain: configuration.iconPack,
                                       iconPackSecondary: nil,
                                       nameLabelWidth: configuration.nameLabelWidth,
                                       numberOfLines: configuration.nameLabelNumberOfLines)
        return ToolInterfaceElementFlex.greenButton(flexLongData)
    }
    
}
