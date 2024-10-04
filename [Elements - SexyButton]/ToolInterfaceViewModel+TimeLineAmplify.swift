//
//  ToolInterfaceViewModel+TimeLineAmplify.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineAmplifySexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineAmplifyLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineAmplifyLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineAmplify = MagicalSexyButtonViewModelTimeLineAmplify(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineAmplify,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineAmplify,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineAmplify.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
