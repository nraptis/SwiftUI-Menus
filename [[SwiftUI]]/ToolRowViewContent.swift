//
//  ToolRowView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/18/24.
//

import SwiftUI

struct ToolRowViewContent: View {
    
    @Environment(ToolInterfaceLayoutRelay.self) var toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay
    
    let toolRow: ToolRow
    let height: Int
    let orientation: Orientation
    init(toolRow: ToolRow,
         height: Int,
         orientation: Orientation) {
        self.toolRow = toolRow
        self.height = height
        self.orientation = orientation
    }
    
    var body: some View {
        
        let width = toolInterfaceLayoutRelay.menuWidthWithSafeArea - (toolInterfaceLayoutRelay.safeAreaLeft + toolInterfaceLayoutRelay.safeAreaRight)
        
        return ZStack {
            GeometryReader { _ in
                ForEach(toolRow.nodes) { toolNode in
                    getItemForElement(toolNode, toolNode.element)
                }
            }
            //.ignoresSafeArea(edges: .all)
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .background(ToolInterfaceTheme.toolbarBackground)
        //.ignoresSafeArea(edges: .all)
        //.overlay {
        //    RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.blue.opacity(0.5))
                //.ignoresSafeArea(edges: .all)
        //}
        //.ignoresSafeArea(edges: .all)
        
        //.ignoresSafeArea(edges: .all)
        //.edgesIgnoringSafeArea(.all)
        
    }
    
    @ViewBuilder
    func getItemForElement(_ toolNode: ToolNode, _ toolInterfaceElement: ToolInterfaceElement) -> some View {
        
        if toolNode.element.type == .sexyCheckBox {
            MagicalSexyCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalSexyCheckBoxViewModel))
        }
        
        if toolNode.element.type == .sexyStepper {
            MagicalSexyStepper()
                .environment((toolNode.magicalViewModel as! MagicalSexyStepperViewModel))
        }
        
        if toolNode.element.type == .sexyButton {
            MagicalSexyButton()
                .environment((toolNode.magicalViewModel as! MagicalSexyButtonViewModel))
        }
        
        if toolInterfaceElement == .dividerTiny {
            MagicalDividerTiny()
                .environment(toolNode.magicalViewModel)
        }
        
        if toolInterfaceElement == .dividerHuge {
            MagicalDividerHuge()
                .environment(toolNode.magicalViewModel)
        }
        
        if toolNode.element == .dividerSpacerDivider {
            MagicalDividerSpacerDivider()
                .environment(toolNode.magicalViewModel)
        }
        
        if toolNode.element.type == .slider {
            MagicalSlider()
                .environment((toolNode.magicalViewModel as! MagicalSliderViewModel))
        }
        
        if toolNode.element.type == .textIconButton {
            MagicalTextIconButton()
                .environment((toolNode.magicalViewModel as! MagicalTextIconButtonViewModel))
        }
        
        if toolNode.element.type == .iconButton {
            MagicalIconButton()
                .environment((toolNode.magicalViewModel as! MagicalIconButtonViewModel))
        }
        
        if toolNode.element.type == .checkBox {
            MagicalCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalCheckBoxViewModel))
        }
        
        if toolNode.element.type == .segment {
            MagicalSegmentedPickerPrimary()
                .environment((toolNode.magicalViewModel as! MagicalSegmentedPickerViewModel))
        }
        
        if toolNode.element.type == .mainTab {
            MagicalMainTab()
                .environment((toolNode.magicalViewModel as! MagicalMainTabViewModel))
        }
        
        if toolNode.element.type == .createSwatch {
            MagicalCreateSwatch()
                .environment((toolNode.magicalViewModel as! MagicalCreateSwatchViewModel))
        }
        
        if toolNode.element.type == .enterMode {
            MagicalEnterMode()
                .environment((toolNode.magicalViewModel as! MagicalModeChangeViewModel))
        }
        
        if toolNode.element.type == .exitMode {
            MagicalExitMode()
                .environment((toolNode.magicalViewModel as! MagicalModeChangeViewModel))
        }
        
        if toolNode.element.type == .greenButton {
            MagicalGreenButton()
                .environment((toolNode.magicalViewModel as! MagicalGreenButtonViewModel))
        }
        
        if toolNode.element.type == .favoringOneLineLabel {
            MagicalFavoringOneLineLabel()
                .environment((toolNode.magicalViewModel as! MagicalFavoringOneLineLabelViewModel))
        }
    }
}
