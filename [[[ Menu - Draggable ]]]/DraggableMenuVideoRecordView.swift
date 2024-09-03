//
//  DraggableMenuVideoRecordView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/25/24.
//

import UIKit

class DraggableMenuVideoRecordView: UIView, MenuPartWithRowsConforming {
    
    var separatorViews = [UIView]()
    var rowViews = [ToolRowView]()
    func getNumberOfRows() -> Int { ToolInterfaceTheme.getDraggableMenuVideoRecordRowCount() }
    func getWidthSource() -> ToolRowViewContent.WidthSource { .standard }
    func getToolRow(at index: Int) -> ToolRow? {
        if index >= 0 && index < toolInterfaceViewModel.rowsVideoRecord.count {
            return toolInterfaceViewModel.rowsVideoRecord[index]
        }
        return nil
    }
    
    lazy var separatorTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        return result
    }()
    
    lazy var separatorBottom: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        return result
    }()
    
    func handleDarkModeDidChange() {
        _handleDarkModeDidChange()
        if ApplicationController.isDarkModeEnabled {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        if ApplicationController.isDarkModeEnabled {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
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
        let rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
        
        setupRows(width: width,
                  offset: rowSeparatorHeightTop,
                  rowHeight: rowHeight,
                  rowSeparatorHeight: rowSeparatorHeight,
                  reversed: false)
        
        addSubview(separatorTop)
        addConstraints([
            NSLayoutConstraint(item: separatorTop, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        separatorTop.addConstraint(NSLayoutConstraint(item: separatorTop, attribute: .height, relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightTop)))
        
        addSubview(separatorBottom)
        addConstraints([
            NSLayoutConstraint(item: separatorBottom, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        separatorBottom.addConstraint(NSLayoutConstraint(item: separatorBottom, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightBottom)))
    
    }
}
