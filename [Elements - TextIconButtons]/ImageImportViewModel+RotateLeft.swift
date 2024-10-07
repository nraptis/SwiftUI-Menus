//
//  ImageImportViewModel+RotateLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getRotateLeftSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextRotateLeftLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextRotateLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                            orientation: Self.orientation,
                                                                            nameLabelLine1: textLine1,
                                                                            nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyButtonFlex(orientation: Self.orientation,
                                                                configuration: configuration,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateLeft = MagicalSexyButtonViewModelRotateLeft(orientation: Self.orientation,
                                                                       sexyButtonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .sexyButtonImageImporterRotateLeft,
                                                   flex: flex,
                                                   magicalViewModel: viewModelRotateLeft,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelRotateLeft.refresh()
        return generateGuidesToolNode
    }
}
