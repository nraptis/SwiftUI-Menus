//
//  ToolInterfaceViewModel+FavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
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
