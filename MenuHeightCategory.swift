//
//  MenuHeightCategory.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

// On iPad, there is only one height category.
// On iPhone, there is 2 height categories, one for each menu.

struct MenuHeightCategoryGeneric {
    
    @MainActor static func `get`(orientation: Orientation, rowCount: Int, isTop: Bool) -> Int {
        var result = 0
        
        if Device.isPad {
            let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
            let rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
            
            result += ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
            result += rowCount * rowHeight
            if rowCount > 1 {
                result += (rowSeparatorHeight) * (rowCount - 1)
            }
            result += ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
        } else {
            let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
            let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
            if isTop {
                result += ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
            } else {
                result += ToolInterfaceTheme.getBottomRowSeparatorHeightTop(orientation: orientation)
            }
            result += rowCount * rowHeight
            if rowCount > 1 {
                result += (rowSeparatorHeight) * (rowCount - 1)
            }
            if isTop {
                result += ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
            } else {
                result += ToolInterfaceTheme.getBottomRowSeparatorHeightBottom(orientation: orientation)
            }
        }
        
        return result
    }
}

enum MenuHeightCategoryPad: UInt8 {
    
    // All 6 lines, top tool-bar, bottom tool-bar.
    case standard
    case videoRecord
    case videoExport
    case zoom
    
    @MainActor static func `get`(configuration: InterfaceConfigurationPad,
                      orientation: Orientation) -> Int {
        get(category: configuration.heightCategory,
            orientation: orientation,
            isExpanded: configuration.isExpanded)
    }
    
    @MainActor static func `get`(category: MenuHeightCategoryPad,
                      orientation: Orientation,
                      isExpanded: Bool) -> Int {
        var result = ToolInterfaceTheme.getDraggableMenuTopToolbarHeight()
        if isExpanded {
            
            let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
            let rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
            
            var rowCount: Int
            switch category {
            case .standard:
                rowCount = ToolInterfaceTheme.getDraggableMenuStandardRowCount()
            case .videoRecord:
                rowCount = ToolInterfaceTheme.getDraggableMenuVideoRecordRowCount()
            case .videoExport:
                rowCount = ToolInterfaceTheme.getDraggableMenuVideoExportRowCount()
            case .zoom:
                rowCount = ToolInterfaceTheme.getDraggableMenuZoomRowCount()
            }
            
            result += ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
            result += rowCount * rowHeight
            if rowCount > 1 {
                result += (rowSeparatorHeight) * (rowCount - 1)
            }
            result += ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
            result += ToolInterfaceTheme.getDraggableMenuBottomToolbarHeight()
        }
        return result
    }
}

enum MenuHeightCategoryPhoneTop: UInt8 {
    
    case standard
    case graph
    case timeLine
    case videoRecord
    case videoExport
    case zoom
    
    @MainActor static func `get`(configuration: InterfaceConfigurationPhone,
                      orientation: Orientation) -> Int {
        get(category: configuration.heightCategoryTop,
            orientation: orientation)
        
    }
    
    @MainActor static func `get`(category: MenuHeightCategoryPhoneTop,
                      orientation: Orientation) -> Int {
        var rowCount: Int
        switch category {
        case .standard:
            rowCount = ToolInterfaceTheme.getTopMenuStandardRowCount(orientation: orientation)
        case .graph:
            rowCount = ToolInterfaceTheme.getTopMenuGraphRowCount(orientation: orientation)
        case .timeLine:
            rowCount = ToolInterfaceTheme.getTopMenuTimeLineRowCount(orientation: orientation)
        case .videoRecord:
            rowCount = ToolInterfaceTheme.getTopMenuVideoRecordRowCount(orientation: orientation)
        case .videoExport:
            rowCount = ToolInterfaceTheme.getTopMenuVideoExportRowCount(orientation: orientation)
        case .zoom:
            rowCount = ToolInterfaceTheme.getTopMenuZoomRowCount(orientation: orientation)
        }
            
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        var result = 0
        result += ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        result += rowCount * rowHeight
        if rowCount > 1 {
            result += (rowSeparatorHeight) * (rowCount - 1)
        }
        result += ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        return result
    }
}

enum MenuHeightCategoryPhoneBottom: UInt8 {
    
    case standard
    case videoRecord
    case videoExport
    case zoom
    
    @MainActor static func `get`(configuration: InterfaceConfigurationPhone,
                      orientation: Orientation) -> Int {
        get(category: configuration.heightCategoryBottom,
            orientation: orientation)
        
    }
    
    @MainActor static func `get`(category: MenuHeightCategoryPhoneBottom,
                      orientation: Orientation) -> Int {
        var rowCount: Int
        switch category {
        case .standard:
            rowCount = ToolInterfaceTheme.getBottomMenuStandardRowCount(orientation: orientation)
        case .videoRecord:
            rowCount = ToolInterfaceTheme.getBottomMenuVideoRecordRowCount(orientation: orientation)
        case .videoExport:
            rowCount = ToolInterfaceTheme.getBottomMenuVideoExportRowCount(orientation: orientation)
        case .zoom:
            rowCount = ToolInterfaceTheme.getBottomMenuZoomRowCount(orientation: orientation)
        }
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        var result = 0
        result += ToolInterfaceTheme.getBottomRowSeparatorHeightTop(orientation: orientation)
        result += rowCount * rowHeight
        if rowCount > 1 {
            result += (rowSeparatorHeight) * (rowCount - 1)
        }
        result += ToolInterfaceTheme.getBottomRowSeparatorHeightBottom(orientation: orientation)
        return result
    }
}

extension MenuHeightCategoryPad: Equatable {
    static func == (lhs: MenuHeightCategoryPad, rhs: MenuHeightCategoryPad) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension MenuHeightCategoryPhoneTop: Equatable {
    static func == (lhs: MenuHeightCategoryPhoneTop, rhs: MenuHeightCategoryPhoneTop) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension MenuHeightCategoryPhoneBottom: Equatable {
    static func == (lhs: MenuHeightCategoryPhoneBottom, rhs: MenuHeightCategoryPhoneBottom) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}
