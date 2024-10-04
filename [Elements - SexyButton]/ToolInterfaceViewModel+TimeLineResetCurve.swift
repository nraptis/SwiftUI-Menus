//
//  ToolInterfaceViewModel+TimeLineResetCurve.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/22/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineResetCurveSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetCurve = MagicalSexyButtonViewModelTimeLineResetCurve(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineResetCurve,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineResetCurve,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetCurve.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
