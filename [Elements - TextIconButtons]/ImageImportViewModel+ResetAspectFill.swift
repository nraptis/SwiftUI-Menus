//
//  ImageImportViewModel+ResetAspectFill.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getResetAspectFillSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextResetAspectFillLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextResetAspectFillLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                            orientation: Self.orientation,
                                                                            nameLabelLine1: textLine1,
                                                                            nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyButtonFlex(orientation: Self.orientation,
                                                                configuration: configuration,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        
        let viewModelResetAspectFill = MagicalSexyButtonViewModelResetAspectFill(orientation: Self.orientation,
                                                                                 sexyButtonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .sexyButtonImageImporterResetAspectFill,
                                                   flex: flex,
                                                   magicalViewModel: viewModelResetAspectFill,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelResetAspectFill.refresh()
        return generateGuidesToolNode
    }
}
