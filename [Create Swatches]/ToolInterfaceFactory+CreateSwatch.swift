//
//  ToolInterfaceFactory+CreateSwatch.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getMakeAndDrawJiggleCreateSwatchToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        let makeJiggleTextIconPack = FramedLongIconLibrary.makeJiggle
        let makeJiggleLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeJiggleLine1()
        let makeJiggleLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeJiggleLine2()
        let makeJiggleConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                                          iconPack: makeJiggleTextIconPack,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: makeJiggleLine1,
                                                                                          nameLabelLine2: makeJiggleLine2)
        buttonConfigurations.append(makeJiggleConfiguration)
        
        let drawJiggleIconPack = FramedLongIconLibrary.drawJiggle
        let drawJiggleLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawJiggleLine1()
        let drawJiggleLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawJiggleLine2()
        let drawJiggleConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                                          iconPack: drawJiggleIconPack,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: drawJiggleLine1,
                                                                                          nameLabelLine2: drawJiggleLine2)
        buttonConfigurations.append(drawJiggleConfiguration)
        
        let moveJiggleCentersIconPack = FramedLongIconLibrary.jiggleCenter
        let moveJiggleCentersLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextJiggleCentersLine1()
        let moveJiggleCentersLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextJiggleCentersLine2()
        let moveJiggleCentersConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 2,
                                                                                                 iconPack: moveJiggleCentersIconPack,
                                                                                                 orientation: orientation,
                                                                                                 nameLabelLine1: moveJiggleCentersLine1,
                                                                                                 nameLabelLine2: moveJiggleCentersLine2)
        buttonConfigurations.append(moveJiggleCentersConfiguration)
        
        
        
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        let viewModelMakeAndDrawJiggle = MagicalCreateSwatchViewModelMakeAndDrawJiggle(orientation: orientation,
                                                                                  createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchMakeAndDrawJiggle,
                              flex: flex,
                              magicalViewModel: viewModelMakeAndDrawJiggle,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelMakeAndDrawJiggle.refresh()
        return result
    }
    
    static func getAddAndRemoveJigglePointsCreateSwatchToolNode(orientation: Orientation,
                                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        let addJigglePointTextIconPack = FramedLongIconLibrary.makeGuide
        let addJigglePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddJigglePointLine1()
        let addJigglePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddJigglePointLine2()
        let addJigglePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                                              iconPack: addJigglePointTextIconPack,
                                                                                              orientation: orientation,
                                                                                              nameLabelLine1: addJigglePointLine1,
                                                                                              nameLabelLine2: addJigglePointLine2)
        buttonConfigurations.append(addJigglePointConfiguration)
        
        let removeJigglePointIconPack = FramedLongIconLibrary.drawJiggle
        let removeJigglePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveJigglePointLine1()
        let removeJigglePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveJigglePointLine2()
        let removeJigglePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                                                 iconPack: removeJigglePointIconPack,
                                                                                                 orientation: orientation,
                                                                                                 nameLabelLine1: removeJigglePointLine1,
                                                                                                 nameLabelLine2: removeJigglePointLine2)
        buttonConfigurations.append(removeJigglePointConfiguration)
        
        let moveJiggleCentersIconPack = FramedLongIconLibrary.jiggleCenter
        let moveJiggleCentersLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextJiggleCentersLine1()
        let moveJiggleCentersLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextJiggleCentersLine2()
        let moveJiggleCentersConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 2,
                                                                                                 iconPack: moveJiggleCentersIconPack,
                                                                                                 orientation: orientation,
                                                                                                 nameLabelLine1: moveJiggleCentersLine1,
                                                                                                 nameLabelLine2: moveJiggleCentersLine2)
        buttonConfigurations.append(moveJiggleCentersConfiguration)
        
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        let viewModelAddAndRemoveJigglePoints = MagicalCreateSwatchViewModelAddAndRemoveJigglePoints(orientation: orientation,
                                                                                         createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchAddAndRemoveJigglePoints,
                              flex: flex,
                              magicalViewModel: viewModelAddAndRemoveJigglePoints,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelAddAndRemoveJigglePoints.refresh()
        return result
    }
    
    static func getMakeAndDrawGuideCreateSwatchToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        let makeGuideTextIconPack = FramedLongIconLibrary.menuC
        let makeGuideLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeGuideLine1()
        let makeGuideLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeGuideLine2()
        let makeGuideConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                                         iconPack: makeGuideTextIconPack,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: makeGuideLine1,
                                                                                         nameLabelLine2: makeGuideLine2)
        buttonConfigurations.append(makeGuideConfiguration)
        
        let drawGuideIconPack = FramedLongIconLibrary.menuC
        let drawGuideLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawGuideLine1()
        let drawGuideLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawGuideLine2()
        let drawGuideConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                                         iconPack: drawGuideIconPack,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: drawGuideLine1,
                                                                                         nameLabelLine2: drawGuideLine2)
        buttonConfigurations.append(drawGuideConfiguration)
        
        
        let moveGuideCentersIconPack = FramedLongIconLibrary.guideCenter
        let moveGuideCentersLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextGuideCentersLine1()
        let moveGuideCentersLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextGuideCentersLine2()
        let moveGuideCentersConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 2,
                                                                                                iconPack: moveGuideCentersIconPack,
                                                                                                orientation: orientation,
                                                                                                nameLabelLine1: moveGuideCentersLine1,
                                                                                                nameLabelLine2: moveGuideCentersLine2)
        buttonConfigurations.append(moveGuideCentersConfiguration)
        
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        let viewModelMakeAndDrawGuide = MagicalCreateSwatchViewModelMakeAndDrawGuide(orientation: orientation,
                                                                                 createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchMakeAndDrawGuide,
                              flex: flex,
                              magicalViewModel: viewModelMakeAndDrawGuide,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelMakeAndDrawGuide.refresh()
        return result
    }
    
    static func getAddAndRemoveGuidePointsCreateSwatchToolNode(orientation: Orientation,
                                                               neighborTypeLeft: ToolInterfaceElementType?,
                                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        let addGuidePointTextIconPack = FramedLongIconLibrary.testArrowRight
        let addGuidePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddGuidePointLine1()
        let addGuidePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddGuidePointLine2()
        let addGuidePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                                             iconPack: addGuidePointTextIconPack,
                                                                                             orientation: orientation,
                                                                                             nameLabelLine1: addGuidePointLine1,
                                                                                             nameLabelLine2: addGuidePointLine2)
        buttonConfigurations.append(addGuidePointConfiguration)
        
        let removeGuidePointIconPack = FramedLongIconLibrary.menuC
        let removeGuidePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveGuidePointLine1()
        let removeGuidePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveGuidePointLine2()
        let removeGuidePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                                                iconPack: removeGuidePointIconPack,
                                                                                                orientation: orientation,
                                                                                                nameLabelLine1: removeGuidePointLine1,
                                                                                                nameLabelLine2: removeGuidePointLine2)
        buttonConfigurations.append(removeGuidePointConfiguration)
        
        
        let moveGuideCentersIconPack = FramedLongIconLibrary.guideCenter
        let moveGuideCentersLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextGuideCentersLine1()
        let moveGuideCentersLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextGuideCentersLine2()
        let moveGuideCentersConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 2,
                                                                                                iconPack: moveGuideCentersIconPack,
                                                                                                orientation: orientation,
                                                                                                nameLabelLine1: moveGuideCentersLine1,
                                                                                                nameLabelLine2: moveGuideCentersLine2)
        buttonConfigurations.append(moveGuideCentersConfiguration)
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        let viewModelAddAndRemoveGuidePoints = MagicalCreateSwatchViewModelAddAndRemoveGuidePoints(orientation: orientation,
                                                                                        createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchAddAndRemoveGuidePoints,
                              flex: flex,
                              magicalViewModel: viewModelAddAndRemoveGuidePoints,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelAddAndRemoveGuidePoints.refresh()
        return result
    }
    
}
