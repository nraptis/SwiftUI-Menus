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
        
        let outsideBoxLeftSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                             squeeze: .squeezed,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                             squeeze: .standard,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                            squeeze: .relaxed,
                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                            neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
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

/*
@MainActor static func getFavoringOneLineLabelToolNode(orientation: Orientation,
                              minimumWidth: Int,
                              text: String,
                              neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
    
    let configuration = ToolInterfaceElementFavoringOneLineLabelConfiguration(orientation: orientation,
                                                                              text: text)
    let viewModel = MagicalFavoringOneLineLabelViewModel(orientation: orientation,
                                                         favoringOneLineLabelConfiguration: configuration)
    
    let standardPaddingLeft = FavoringOneLineLabelLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                 flavor: .long,
                                                                                 squeeze: .standard,
                                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                                 neighborTypeRight: neighborTypeRight)
    let standardPaddingRight = FavoringOneLineLabelLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                   flavor: .long,
                                                                                   squeeze: .standard,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
    let oneLineWidthPadded = configuration.oneLineWidth + standardPaddingLeft + standardPaddingRight
    let flexData = FlexFavoringOneLineLabelData(minimumWidth: minimumWidth,
                                                twoLineWidth: configuration.twoLineWidth,
                                                oneLineWidth: configuration.oneLineWidth,
                                                oneLineWidthPadded: oneLineWidthPadded)
    
    return ToolNode(id: getToolNodeID(),
                    element: .favoringOneLineLabel,
                    flex: .favoringOneLineLabel(flexData),
                    magicalViewModel: viewModel,
                    neighborTypeLeft: neighborTypeLeft,
                    neighborTypeRight: neighborTypeRight)
}
*/
