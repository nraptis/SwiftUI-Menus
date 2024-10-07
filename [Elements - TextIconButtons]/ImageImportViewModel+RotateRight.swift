//
//  ImageImportViewModel+RotateRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getRotateRightSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextRotateRightLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextRotateRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                            orientation: Self.orientation,
                                                                            nameLabelLine1: textLine1,
                                                                            nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyButtonFlex(orientation: Self.orientation,
                                                                configuration: configuration,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateRight = MagicalSexyButtonViewModelRotateRight(orientation: Self.orientation,
                                                                         sexyButtonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .sexyButtonImageImporterRotateRight,
                                                   flex: flex,
                                                   magicalViewModel: viewModelRotateRight,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelRotateRight.refresh()
        return generateGuidesToolNode
    }
}
