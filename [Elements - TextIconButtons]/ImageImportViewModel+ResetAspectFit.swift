//
//  ImageImportViewModel+ResetAspectFit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getResetAspectFitSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextResetAspectFitLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextResetAspectFitLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, 
                                                                            orientation: Self.orientation,
                                                                            nameLabelLine1: textLine1,
                                                                            nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyButtonFlex(orientation: Self.orientation,
                                                                configuration: configuration,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        
        let viewModelResetAspectFit = MagicalSexyButtonViewModelResetAspectFit(orientation: Self.orientation,
                                                                               sexyButtonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .sexyButtonImageImporterResetAspectFit,
                                                   flex: flex,
                                                   magicalViewModel: viewModelResetAspectFit,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelResetAspectFit.refresh()
        return generateGuidesToolNode
    }
}
