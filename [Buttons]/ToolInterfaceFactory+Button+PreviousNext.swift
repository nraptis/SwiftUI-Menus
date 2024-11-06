//
//  ToolInterfaceFactory+Button+PreviousNext.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getSelectPreviousJiggleButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousJiggle = MagicalButtonViewModelSelectPreviousJiggle(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let selectPreviousJiggleToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonSelectPreviousJiggle,
                                                    flex: flex,
                                                    magicalViewModel: viewModelSelectPreviousJiggle,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousJiggle.refresh()
        return selectPreviousJiggleToolNode
    }
    
    static func getSelectNextJiggleButtonToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextJiggle = MagicalButtonViewModelSelectNextJiggle(orientation: orientation,
                                                                               buttonConfiguration: configuration)
        let selectNextJiggleToolNode = ToolNode(id: getToolNodeID(),
                                                element: .buttonSelectNextJiggle,
                                                flex: flex,
                                                magicalViewModel: viewModelSelectNextJiggle,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelSelectNextJiggle.refresh()
        return selectNextJiggleToolNode
    }
    
    static func getSelectPreviousJigglePointButtonToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJigglePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectPreviousJigglePoint = MagicalButtonViewModelSelectPreviousJigglePoint(orientation: orientation,
                                                                                                 buttonConfiguration: configuration)
        let selectPreviousJigglePointToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .buttonSelectPreviousJigglePoint,
                                                         flex: flex,
                                                         magicalViewModel: viewModelSelectPreviousJigglePoint,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousJigglePoint.refresh()
        return selectPreviousJigglePointToolNode
    }
    
    static func getSelectNextJigglePointButtonToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJigglePointLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectNextJigglePoint = MagicalButtonViewModelSelectNextJigglePoint(orientation: orientation,
                                                                                         buttonConfiguration: configuration)
        let selectNextJigglePointToolNode = ToolNode(id: getToolNodeID(),
                                                     element: .buttonSelectNextJigglePoint,
                                                     flex: flex,
                                                     magicalViewModel: viewModelSelectNextJigglePoint,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelSelectNextJigglePoint.refresh()
        return selectNextJigglePointToolNode
    }
    
    static func getSelectPreviousGuideButtonToolNode(orientation: Orientation,
                                                     neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectPreviousGuide = MagicalButtonViewModelSelectPreviousGuide(orientation: orientation,
                                                                                     buttonConfiguration: configuration)
        let selectPreviousGuideToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .buttonSelectPreviousGuide,
                                                   flex: flex,
                                                   magicalViewModel: viewModelSelectPreviousGuide,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousGuide.refresh()
        return selectPreviousGuideToolNode
    }
    
    static func getSelectNextGuideButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectNextGuide = MagicalButtonViewModelSelectNextGuide(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let selectNextGuideToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonSelectNextGuide,
                                               flex: flex,
                                               magicalViewModel: viewModelSelectNextGuide,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelSelectNextGuide.refresh()
        return selectNextGuideToolNode
    }
    
    static func getSelectPreviousGuidePointButtonToolNode(orientation: Orientation,
                                                          neighborTypeLeft: ToolInterfaceElementType?,
                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuidePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectPreviousGuidePoint = MagicalButtonViewModelSelectPreviousGuidePoint(orientation: orientation,
                                                                                               buttonConfiguration: configuration)
        let selectPreviousGuidePointToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .buttonSelectPreviousGuidePoint,
                                                        flex: flex,
                                                        magicalViewModel: viewModelSelectPreviousGuidePoint,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousGuidePoint.refresh()
        return selectPreviousGuidePointToolNode
    }
    
    static func getSelectNextGuidePointButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuidePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelSelectNextGuidePoint = MagicalButtonViewModelSelectNextGuidePoint(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let selectNextGuidePointToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonSelectNextGuidePoint,
                                                    flex: flex,
                                                    magicalViewModel: viewModelSelectNextGuidePoint,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectNextGuidePoint.refresh()
        return selectNextGuidePointToolNode
    }
    
}
