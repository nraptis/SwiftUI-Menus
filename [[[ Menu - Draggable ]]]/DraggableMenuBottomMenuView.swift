//
//  DraggableMenuBottomMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/4/24.
//

import UIKit

class DraggableMenuBottomMenuView: UIView, MenuPartWithRowsConforming {
    
    var separatorViews = [UIView]()
    var rowViews = [ToolRowView]()
    func getNumberOfRows() -> Int { ToolInterfaceTheme.getDraggableMenuStandardBottomHalfRowCount() }
    func getWidthSource() -> ToolRowViewContent.WidthSource { .standard }
    func getToolRow(at index: Int) -> ToolRow? {
        let index = (index + ToolInterfaceTheme.getDraggableMenuStandardTopHalfRowCount())
        if index >= 0 && index < toolInterfaceViewModel.rowsDraggable.count {
            return toolInterfaceViewModel.rowsDraggable[index]
        }
        return nil
    }
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.toolInterfaceLayoutRelay = toolInterfaceViewModel.layoutRelay
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(width: Int) {
        let orientation = toolInterfaceViewModel.orientation
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
        
        setupRows(width: width,
                  offset: 0,
                  rowHeight: rowHeight,
                  rowSeparatorHeight: rowSeparatorHeight,
                  reversed: false)
    }
}
