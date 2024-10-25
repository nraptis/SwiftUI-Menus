//
//  ToolInterfaceViewModel+NodeGeneration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import UIKit

extension ToolInterfaceFactory {
    
    static func generateNodes(orientation: Orientation, inrs: [INR]) -> [ToolNode] {
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
            let nodes = generateNodes(orientation: orientation,
                                      inr: inr,
                                      left: left,
                                      right: right)
            result.append(contentsOf: nodes)
            
        }
        return result
    }
    
    static func generateNodes(orientation: Orientation, inr: INR, left: INR?, right: INR?) -> [ToolNode] {
        
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
            result.append(generateNode_Button(orientation: orientation, inr: buttonA, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: .dividerTiny))
            result.append(generateNode_DividerTiny(orientation: orientation, neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(orientation: orientation, inr: buttonB, neighborTypeLeft: .dividerTiny, neighborTypeRight: .button))
            result.append(generateNode_DividerTiny(orientation: orientation, neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(orientation: orientation, inr: buttonC, neighborTypeLeft: .dividerTiny, neighborTypeRight: neighborTypeRight))
        case .button_pair(let buttonA, let buttonB):
            result.append(generateNode_Button(orientation: orientation, inr: buttonA, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: .dividerTiny))
            result.append(generateNode_DividerTiny(orientation: orientation, neighborTypeLeft: .button, neighborTypeRight: .button))
            result.append(generateNode_Button(orientation: orientation, inr: buttonB, neighborTypeLeft: .dividerTiny, neighborTypeRight: neighborTypeRight))
        case .button(let iNR_Button):
            result.append(generateNode_Button(orientation: orientation,
                                              inr: iNR_Button,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .spacer:
            result.append(generateNode_Spacer(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .dividerHuge:
            result.append(generateNode_DividerHuge(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .dividerTiny:
            result.append(generateNode_DividerTiny(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .dividerSpacerDivider:
            result.append(generateNode_DividerSpacerDivider(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight))
        case .checkBox(let iNR_CheckBox):
            result.append(generateNode_CheckBox(orientation: orientation,
                                                inr: iNR_CheckBox,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight))
        case .segment(let iNR_Segment):
            result.append(generateNode_Segment(orientation: orientation,
                                               inr: iNR_Segment,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
        case .slider(let iNR_Slider_Data):
            result.append(generateNode_Slider(orientation: orientation,
                                              inr: iNR_Slider_Data,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight))
        case .enterMode(let iNR_EnterMode):
            result.append(generateNode_EnterMode(orientation: orientation,
                                                 inr: iNR_EnterMode,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight))
        case .exitMode(let iNR_ExitMode):
            result.append(generateNode_ExitMode(orientation: orientation,
                                                inr: iNR_ExitMode,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight))
        case .createSwatch(let iNR_CreateSwatch):
            result.append(generateNode_CreateSwatch(orientation: orientation,
                                                    inr: iNR_CreateSwatch,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight))
        case .mainTab(let iNR_MainTab):
            result.append(generateNode_MainTab(orientation: orientation,
                                               inr: iNR_MainTab,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
        case .favoringOneLineLabel(let iNR_FavoringOneLineLabelData):
            result.append(generateNode_FavoringOneLineLabel(orientation: orientation,
                                                            inr: iNR_FavoringOneLineLabelData,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight))
        case .greenButton(let iNR_GreenButton):
            result.append(generateNode_GreenButton(orientation: orientation,
                                                   inr: iNR_GreenButton,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight))
        case .stepper(let iNR_Stepper):
            result.append(generateNode_Stepper(orientation: orientation,
                                               inr: iNR_Stepper,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight))
            
        }
        return result
    }
}
