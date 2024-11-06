//
//  ToolInterfaceFactory+Button+PhotoImporter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getImageImportBackButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = GeneralStringLibrary.generalTextBackLine1()
        let textLine2 = GeneralStringLibrary.generalTextBackLine1()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, orientation: ImageImportViewModel.orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: ImageImportViewModel.orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelImageImportBack = MagicalButtonViewModelImageImportBack(orientation: ImageImportViewModel.orientation,
                                                                             buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonImageImporterButtonBack,
                                              flex: flex,
                                              magicalViewModel: viewModelImageImportBack,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelImageImportBack.refresh()
        return generateGuidesToolNode
    }
    
    static func getImageImporterRotateRightButtonToolNode(orientation: Orientation,
                                                          neighborTypeLeft: ToolInterfaceElementType?,
                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextRotateRightLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextRotateRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: ImageImportViewModel.orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: ImageImportViewModel.orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateRight = MagicalButtonViewModelRotateRight(orientation: ImageImportViewModel.orientation,
                                                                     buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonImageImporterRotateRight,
                                              flex: flex,
                                              magicalViewModel: viewModelRotateRight,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelRotateRight.refresh()
        return generateGuidesToolNode
    }
    
    static func getImageImporterRotateLeftButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextRotateLeftLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextRotateLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: ImageImportViewModel.orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: ImageImportViewModel.orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateLeft = MagicalButtonViewModelRotateLeft(orientation: ImageImportViewModel.orientation,
                                                                   buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonImageImporterRotateLeft,
                                              flex: flex,
                                              magicalViewModel: viewModelRotateLeft,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelRotateLeft.refresh()
        return generateGuidesToolNode
    }
    
    static func getImageImporterResetAspectFitButtonToolNode(orientation: Orientation,
                                                             neighborTypeLeft: ToolInterfaceElementType?,
                                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextResetAspectFitLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextResetAspectFitLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: ImageImportViewModel.orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: ImageImportViewModel.orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetAspectFit = MagicalButtonViewModelResetAspectFit(orientation: ImageImportViewModel.orientation,
                                                                           buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonImageImporterResetAspectFit,
                                              flex: flex,
                                              magicalViewModel: viewModelResetAspectFit,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelResetAspectFit.refresh()
        return generateGuidesToolNode
    }
    
    static func getImageImporterResetAspectFillButtonToolNode(orientation: Orientation,
                                                              neighborTypeLeft: ToolInterfaceElementType?,
                                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextResetAspectFillLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextResetAspectFillLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: ImageImportViewModel.orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: ImageImportViewModel.orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetAspectFill = MagicalButtonViewModelResetAspectFill(orientation: ImageImportViewModel.orientation,
                                                                             buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonImageImporterResetAspectFill,
                                              flex: flex,
                                              magicalViewModel: viewModelResetAspectFill,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelResetAspectFill.refresh()
        return generateGuidesToolNode
    }
}
