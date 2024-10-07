//
//  ImageImporterTopMenuContentView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import UIKit

class ImageImporterTopMenuContentView: UIView, MenuPartWithRowsConforming {
    
    var separatorViews = [UIView]()
    var rowViews = [ToolRowView]()
    func getNumberOfRows() -> Int {
        return 2
    }
    
    func getToolRow(at index: Int) -> ToolRow? {
        if let imageImportViewModel = ApplicationController.shared.imageImportViewModel {
            if index >= 0 && index < imageImportViewModel.rowsTop.count {
                return imageImportViewModel.rowsTop[index]
            }
        }
        return nil
    }
    
    lazy var separatorTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentLight
        }
        return result
    }()
    
    lazy var separatorBottom: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentLight
        }
        return result
    }()
    
    let imageImportViewModel: ImageImportViewModel
    let toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay
    init(imageImportViewModel: ImageImportViewModel) {
        self.imageImportViewModel = imageImportViewModel
        self.toolInterfaceLayoutRelay = imageImportViewModel.layoutRelay
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaTop: Int) {
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: ImageImportViewModel.orientation)
        
        let rowSeparatorHeight: Int
        let rowSeparatorHeightTop: Int
        let rowSeparatorHeightBottom: Int
        
        if Device.isPad {
            rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
            rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
            rowSeparatorHeightBottom = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
        } else {
            rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: ImageImportViewModel.orientation)
            rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: ImageImportViewModel.orientation)
            rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: ImageImportViewModel.orientation)
        }
        
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
                                                      attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: CGFloat(rowSeparatorHeightTop)))
        
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
                                                         attribute: .notAnAttribute, multiplier: 1.0,
                                                         constant: CGFloat(rowSeparatorHeightBottom)))
        
    }
    
    func getSecondaryMenu() -> (any MenuPartWithRowsConforming)? {
        nil
    }
    
}
