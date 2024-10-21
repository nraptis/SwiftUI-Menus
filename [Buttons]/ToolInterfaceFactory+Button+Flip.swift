//
//  ToolInterfaceFactory+Button+RotateAndFli[.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getFlipGuideHorizontalButtonToolNode(orientation: Orientation,
                                                     neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideHLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideHLine2()
        
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipGuideH = MagicalButtonViewModelFlipGuideH(orientation: orientation,
                                                                   buttonConfiguration: configuration)
        let flipGuideHToolNode = ToolNode(id: getToolNodeID(),
                                          element: .buttonFlipGuideH,
                                          flex: flex,
                                          magicalViewModel: viewModelFlipGuideH,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelFlipGuideH.refresh()
        return flipGuideHToolNode
    }
    
    static func getFlipGuideVerticalButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideVLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipGuideV = MagicalButtonViewModelFlipGuideV(orientation: orientation,
                                                                   buttonConfiguration: configuration)
        let flipGuideVToolNode = ToolNode(id: getToolNodeID(),
                                          element: .buttonFlipGuideV,
                                          flex: flex,
                                          magicalViewModel: viewModelFlipGuideV,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelFlipGuideV.refresh()
        return flipGuideVToolNode
    }
    
    static func getFlipJiggleHorizontalButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleHLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleHLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipJiggleH = MagicalButtonViewModelFlipJiggleH(orientation: orientation,
                                                                     buttonConfiguration: configuration)
        let flipJiggleHToolNode = ToolNode(id: getToolNodeID(),
                                           element: .buttonFlipJiggleH,
                                           flex: flex,
                                           magicalViewModel: viewModelFlipJiggleH,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelFlipJiggleH.refresh()
        return flipJiggleHToolNode
    }
    
    static func getFlipJiggleVerticalButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleVLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipJiggleV = MagicalButtonViewModelFlipJiggleV(orientation: orientation,
                                                                     buttonConfiguration: configuration)
        let flipJiggleVToolNode = ToolNode(id: getToolNodeID(),
                                           element: .buttonFlipJiggleV,
                                           flex: flex,
                                           magicalViewModel: viewModelFlipJiggleV,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelFlipJiggleV.refresh()
        return flipJiggleVToolNode
    }
    
}
