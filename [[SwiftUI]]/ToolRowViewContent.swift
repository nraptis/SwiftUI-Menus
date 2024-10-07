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
        
        switch toolNode.element.type {
        case .sexyButton:
            MagicalSexyButton()
                .environment((toolNode.magicalViewModel as! MagicalSexyButtonViewModel))
        case .spacer:
            Color.clear
        case .dividerTiny:
            MagicalDividerTiny()
                .environment(toolNode.magicalViewModel)
        case .dividerHuge:
            MagicalDividerHuge()
                .environment(toolNode.magicalViewModel)
        case .dividerSpacerDivider:
            MagicalDividerSpacerDivider()
                .environment(toolNode.magicalViewModel)
            
        case .createSwatch:
            MagicalCreateSwatch()
                .environment((toolNode.magicalViewModel as! MagicalCreateSwatchViewModel))
        case .sexyCheckBox:
            MagicalSexyCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalSexyCheckBoxViewModel))
        case .enterMode:
            MagicalEnterMode()
                .environment((toolNode.magicalViewModel as! MagicalModeChangeViewModel))
        case .exitMode:
            MagicalExitMode()
                .environment((toolNode.magicalViewModel as! MagicalModeChangeViewModel))
        case .mainTab:
            MagicalMainTab()
                .environment((toolNode.magicalViewModel as! MagicalMainTabViewModel))
        case .segment:
            MagicalSegmentedPicker()
                .environment((toolNode.magicalViewModel as! MagicalSegmentedPickerViewModel))
        case .sexyStepper:
            MagicalSexyStepper()
                .environment((toolNode.magicalViewModel as! MagicalSexyStepperViewModel))
        case .iconButton:
            MagicalIconButton()
                .environment((toolNode.magicalViewModel as! MagicalIconButtonViewModel))
        case .greenButton:
            MagicalGreenButton()
                .environment((toolNode.magicalViewModel as! MagicalGreenButtonViewModel))
        case .slider:
            MagicalSlider()
                .environment((toolNode.magicalViewModel as! MagicalSliderViewModel))
        case .favoringOneLineLabel:
            MagicalFavoringOneLineLabel()
                .environment((toolNode.magicalViewModel as! MagicalFavoringOneLineLabelViewModel))
        }
    }
}
