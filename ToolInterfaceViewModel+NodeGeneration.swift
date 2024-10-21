//
//  ToolInterfaceViewModel+NodeGeneration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import UIKit

extension ToolInterfaceViewModel {
    
    @MainActor func generateNodes(_ inrs: [INR]) -> [ToolNode] {
        var result = [ToolNode]()
        let count1 = inrs.count - 1
        for index in 0..<inrs.count {
            let inr = inrs[index]
            var left: INR?
            var right: INR?
            if index > 0 {
                left = inrs[index - 1]
            }
            if index < count1 {
                right = inrs[index + 1]
            }
            let nodes = generateNodes(inr,
                                      left: left,
                                      right: right)
            result.append(contentsOf: nodes)
            
        }
        return result
    }
    
    @MainActor func generateNodes(_ inr: INR, left: INR?, right: INR?) -> [ToolNode] {
        
        let neighborTypeLeft: ToolInterfaceElementType?
        if let left {
            neighborTypeLeft = left.getType()
        } else {
            neighborTypeLeft = nil
        }
        
        let neighborTypeRight: ToolInterfaceElementType?
        if let right {
            neighborTypeRight = right.getType()
        } else {
            neighborTypeRight = nil
        }
        
        var result = [ToolNode]()
        
        switch inr {
        case .button_triplet(let buttonA, let buttonB, let buttonC):
            result.append(generateNode_Button(buttonA, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: .dividerTiny))
            result.append(generateNode_DividerTiny(neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(buttonB, neighborTypeLeft: .dividerTiny, neighborTypeRight: .button))
            result.append(generateNode_DividerTiny(neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(buttonC, neighborTypeLeft: .dividerTiny, neighborTypeRight: neighborTypeRight))
        case .button_pair(let buttonA, let buttonB):
            result.append(generateNode_Button(buttonA, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: .dividerTiny))
            result.append(generateNode_DividerTiny(neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(buttonB, neighborTypeLeft: .dividerTiny, neighborTypeRight: neighborTypeRight))
        case .button(let iNR_Button):
            result.append(generateNode_Button(iNR_Button,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .spacer:
            result.append(generateNode_Spacer(neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .dividerHuge:
            result.append(generateNode_DividerHuge(neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .dividerTiny:
            result.append(generateNode_DividerTiny(neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .dividerSpacerDivider:
            result.append(generateNode_DividerSpacerDivider(neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight))
        case .checkBox(let iNR_CheckBox):
            result.append(generateNode_CheckBox(iNR_CheckBox,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight))
        case .segment(let iNR_Segment):
            result.append(generateNode_Segment(iNR_Segment,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
        case .slider(let iNR_Slider_Data):
            result.append(generateNode_Slider(iNR_Slider_Data,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .enterMode(let iNR_EnterMode):
            result.append(generateNode_EnterMode(iNR_EnterMode,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight))
        case .exitMode(let iNR_ExitMode):
            result.append(generateNode_ExitMode(iNR_ExitMode,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight))
        case .createSwatch(let iNR_CreateSwatch):
            result.append(generateNode_CreateSwatch(iNR_CreateSwatch,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight))
        case .mainTab(let iNR_MainTab):
            result.append(generateNode_MainTab(iNR_MainTab,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
        case .favoringOneLineLabel(let iNR_FavoringOneLineLabelData):
            result.append(generateNode_FavoringOneLineLabel(iNR_FavoringOneLineLabelData,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight))
        case .greenButton(let iNR_GreenButton):
            result.append(generateNode_GreenButton(iNR_GreenButton,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .stepper(let iNR_Stepper):
            result.append(generateNode_Stepper(iNR_Stepper,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
        
        }
        return result
    }
}
