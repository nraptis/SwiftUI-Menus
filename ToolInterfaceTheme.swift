//
//  Theme.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit
import SwiftUI

struct ToolInterfaceTheme {
    
    static func getSideMenuWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            if orientation.isLandscape {
                return 420
            } else {
                return 330
            }
        } else {
            if orientation.isLandscape {
                return 280
            } else {
                return 220
            }
        }
    }
    
    static func getLineHeight(font: UIFont) -> Int {
        let lineHeight = Int(font.lineHeight + 1.5)
        return lineHeight
    }
    
    static func getNumberOfLines(line1: String?,
                                 line2: String?) -> Int {
        
        var numberOfLines = 0
        if line1 != nil { numberOfLines += 1 }
        if line2 != nil { numberOfLines += 1 }
        return numberOfLines
    }
    
    private static var textMinimumWidth = 12
    static func getTextWidth(line1: String?,
                             line2: String?,
                             font: UIFont) -> Int {
        var width1 = CGFloat(0.0)
        if let line1 = line1 {
            width1 = font.stringWidth(line1)
        }
        var width2 = CGFloat(0.0)
        if let line2 = line2 {
            width2 = font.stringWidth(line2)
        }
        var result = Int(max(width1, width2) + 0.5)
        if result < Self.textMinimumWidth {
            result = Self.textMinimumWidth
        }
        return result
    }
    
    static func getTextWidth(line1: String?,
                             font: UIFont) -> Int {
        var width = CGFloat(0.0)
        if let line1 = line1 {
            width = font.stringWidth(line1)
        }
        var result = Int(width + 0.5)
        if result < Self.textMinimumWidth {
            result = Self.textMinimumWidth
        }
        return result
    }
    
    static func getDraggableMenuVideoRecordRowCount() -> Int {
        var result = 2
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        
        return result
    }
    
    static func getDraggableMenuVideoExportRowCount() -> Int {
        var result = 3
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    static func getDraggableMenuZoomRowCount() -> Int {
        var result = 3
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    static func getDraggableMenuStandardRowCount() -> Int {
        return getDraggableMenuStandardTopHalfRowCount() + getDraggableMenuStandardBottomHalfRowCount()
    }
    
    static func getDraggableMenuStandardTopHalfRowCount() -> Int {
        var result = 3
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        return result
    }
    
    static func getDraggableMenuStandardBottomHalfRowCount() -> Int {
        var result = 3
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    static func getDraggableMenuTopToolbarHeight() -> Int {
        return 64
    }
    
    static func getDraggableMenuRowSeparatorHeight() -> Int {
        return 1
    }
    
    static func getDraggableMenuRowSeparatorHeightTop() -> Int {
        return 1
    }
    
    static func getDraggableMenuRowSeparatorHeightBottom() -> Int {
        return 1
    }
    
    static func getDraggableMenuBottomToolbarHeight() -> Int {
        return 32
    }
    
    static func getDraggableMenuGraphInsetLeft() -> Int {
        return 16
    }
    
    static func getDraggableMenuGraphInsetRight() -> Int {
        return 16
    }
    
    static func getDraggableMenuGraphInsetTop() -> Int {
        return 6
    }
    
    static func getDraggableMenuGraphInsetBottom() -> Int {
        return 6
    }
    
    static func getDraggableMenuGraphCornerRadius() -> Int {
        return 12
    }
    
    
    static func getDraggableMenuTimeLineInsetLeft() -> Int {
        return 104
    }
    
    static func getDraggableMenuTimeLineInsetRight() -> Int {
        return 12
    }
    
    static func getDraggableMenuTimeLineInsetTop() -> Int {
        return 6
    }
    
    static func getDraggableMenuTimeLineInsetBottom() -> Int {
        return 12
    }
    
    static func getDraggableMenuTimeLineCornerRadius() -> Int {
        return 12
    }
    
    static func getRowHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 64
        } else {
            switch orientation {
            case .landscape:
                return 44
            case .portrait:
                return 50
            }
        }
    }
    
    static func getStationaryRowSeparatorHeight(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopRowSeparatorHeightTop(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopRowSeparatorHeightBottom(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getBottomRowSeparatorHeightTop(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getBottomRowSeparatorHeightBottom(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopBlockerHeight(orientation: Orientation, safeAreaTop: Int) -> Int {
        var result = (46 - safeAreaTop - 6)
        if result < 0 {
            result = 0
        }
        return result
    }
    
    static func getTopGraphInsetLeft(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getTopGraphInsetRight(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getTopGraphInsetTop(orientation: Orientation) -> Int {
        return 6
    }
    
    static func getTopGraphInsetBottom(orientation: Orientation) -> Int {
        return 6
    }
    
    static func getTopGraphCornerRadius(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getTopTimeLineInsetLeft(orientation: Orientation) -> Int {
        return 70
    }
    
    static func getTopTimeLineInsetRight(orientation: Orientation) -> Int {
        return 6
    }
    
    static func getTopTimeLineInsetTop(orientation: Orientation) -> Int {
        return 12
    }
    
    static func getTopTimeLineInsetBottom(orientation: Orientation) -> Int {
        return 12
    }
    
    static func getTopTimeLineCornerRadius(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getTopMenuStandardRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            var result = 3
            if ApplicationController.TEST_ROW_TOP_1 {
                result += 1
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                result += 1
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                result += 1
            }
            return result
        case .portrait:
            var result = 3
            if ApplicationController.TEST_ROW_TOP_1 {
                result += 1
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                result += 1
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                result += 1
            }
            return result
        }
    }
    
    static func getTopMenuVideoExportRowCount(orientation: Orientation) -> Int {
        var result = 1
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        return result
    }
    
    static func getTopMenuVideoRecordRowCount(orientation: Orientation) -> Int {
        var result = 1
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        return result
    }
    
    static func getTopMenuZoomRowCount(orientation: Orientation) -> Int {
        var result = 2
        if ApplicationController.TEST_ROW_TOP_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_TOP_3 {
            result += 1
        }
        return result
    }
    
    
    static func getTopMenuGraphRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            var result = 3
           
            return result
        case .portrait:
            var result = 4

            return result
        }
    }
    
    static func getTopMenuTimeLineRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            var result = 4
            return result
        case .portrait:
            var result = 5
            return result
        }
    }
    
    
    
    static func getTopMenuShadowHeight(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 4
        case .portrait:
            return 5
        }
    }
    
    
    static func getBottomMenuStandardRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            var result = 3
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                result += 1
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                result += 1
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                result += 1
            }
            return result
        case .portrait:
            var result = 3
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                result += 1
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                result += 1
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                result += 1
            }
            return result
        }
    }
    
    static func getBottomMenuVideoExportRowCount(orientation: Orientation) -> Int {
        var result = 3
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    static func getBottomMenuVideoRecordRowCount(orientation: Orientation) -> Int {
        var result = 1
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    static func getBottomMenuZoomRowCount(orientation: Orientation) -> Int {
        var result = 2
        if ApplicationController.TEST_ROW_BOTTOM_1 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_2 {
            result += 1
        }
        if ApplicationController.TEST_ROW_BOTTOM_3 {
            result += 1
        }
        return result
    }
    
    private static func getBottomMenuHeight(orientation: Orientation, rowCount: Int) -> Int {
        var result = 0
        result += getBottomRowSeparatorHeightTop(orientation: orientation)
        if rowCount > 1 {
            result += getRowHeight(orientation: orientation) * rowCount
            result += getStationaryRowSeparatorHeight(orientation: orientation) * (rowCount - 1)
        } else {
            result += getRowHeight(orientation: orientation)
        }
        result += getBottomRowSeparatorHeightBottom(orientation: orientation)
        print("bottom menu ehight: result: \(result)")
        return result
    }
    
    static func getBottomMenuHeight(orientation: Orientation) -> Int {
        let rowCount = getBottomMenuStandardRowCount(orientation: orientation)
        return getBottomMenuHeight(orientation: orientation, rowCount: rowCount)
    }
    
    static func getBottomMenuShadowHeight(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 4
        case .portrait:
            return 5
        }
    }
    
    
    
    static let _greenButtonFill = UIColor(named: "green_button_fill_up") ?? UIColor()
    static let _greenButtonFillDisabled = UIColor(named: "green_button_fill_up_disabled") ?? UIColor()
    
    static let _greenButtonFillDown = UIColor(named: "green_button_fill_down") ?? UIColor()
    static let _greenButtonFillDownDisabled = UIColor(named: "green_button_fill_down_disabled") ?? UIColor()
    
    
    
    

    
    
    static let _blueBasic = UIColor(red: 0.200, green: 0.630, blue: 1.000, alpha: 1.0)
    static let _orangeBasic = UIColor(red: 1.0, green: 0.556, blue: 0.000, alpha: 1.0)
    
    static let _highlightedYellowUp = UIColor(red: 1.0, green: 0.895, blue: 0.0, alpha: 1.0)
    static let _highlightedYellowDown = UIColor(red: 0.935, green: 0.8, blue: 0.055, alpha: 1.0)
    
    static let _disabledGray = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    
    static let _enabledGrayUp = UIColor(red: 0.9685, green: 0.9685, blue: 0.9685, alpha: 1.0)
    //static let _enabledGrayUp = UIColor(red: 0.9685, green: 0.25, blue: 0.45, alpha: 1.0)
    
    static let _enabledGrayDown = UIColor(red: 0.62745, green: 0.62745, blue: 0.62745, alpha: 1.0)
    
    
    
    static let _checkMarkGreen = UIColor(red: 0.0475, green: 0.9575, blue: 0.09, alpha: 1.0)
    static let _gray010 = UIColor(red: 0.010, green: 0.010, blue: 0.010, alpha: 1.0)
    static let _gray015 = UIColor(red: 0.015, green: 0.015, blue: 0.015, alpha: 1.0)
    static let _gray020 = UIColor(red: 0.020, green: 0.020, blue: 0.020, alpha: 1.0)
    static let _gray025 = UIColor(red: 0.025, green: 0.025, blue: 0.025, alpha: 1.0)
    static let _gray040 = UIColor(red: 0.04, green: 0.04, blue: 0.04, alpha: 1.0)
    static let _gray050 = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0)
    static let _gray075 = UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1.0)
    static let _gray100 = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    static let _gray150 = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
    static let _gray175 = UIColor(red: 0.175, green: 0.175, blue: 0.175, alpha: 1.0)
    static let _gray200 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    static let _gray250 = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    static let _gray300 = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    static let _gray400 = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    static let _gray500 = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let _gray600 = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
    static let _gray700 = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
    static let _gray750 = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
    //static let _gray800 = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    //static let _gray850 = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    //static let _gray900 = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    //static let _gray925 = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1.0)
    //static let _gray950 = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    //static let _gray975 = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1.0)
    
    static let blueBasic = Color(uiColor: _blueBasic)
    static let orangeBasic = Color(uiColor: _orangeBasic)
    static let checkMarkGreen = Color(uiColor: _checkMarkGreen)
    
    static let _draggableBorderLight = _separatorMiddleLight
    static let _draggableBorderDark = _separatorMiddleDark
    
    
    static let highlightedYellowUp = Color(uiColor: _highlightedYellowUp)
    static let highlightedYellowDown = Color(uiColor: _highlightedYellowDown)
    
    static let disabledGray = Color(uiColor: _disabledGray)
    
    static let enabledGrayUp = Color(uiColor: _enabledGrayUp)
    static let enabledGrayDown = Color(uiColor: _enabledGrayDown)
    
    static let gray010 = Color(uiColor: _gray010)
    static let gray015 = Color(uiColor: _gray015)
    static let gray020 = Color(uiColor: _gray020)
    static let gray025 = Color(uiColor: _gray025)
    static let gray040 = Color(uiColor: _gray040)
    static let gray050 = Color(uiColor: _gray050)
    static let gray075 = Color(uiColor: _gray075)
    static let gray100 = Color(uiColor: _gray100)
    static let gray150 = Color(uiColor: _gray150)
    static let gray175 = Color(uiColor: _gray175)
    static let gray200 = Color(uiColor: _gray200)
    static let gray250 = Color(uiColor: _gray250)
    static let gray300 = Color(uiColor: _gray300)
    static let gray400 = Color(uiColor: _gray400)
    static let gray500 = Color(uiColor: _gray500)
    static let gray600 = Color(uiColor: _gray600)
    static let gray700 = Color(uiColor: _gray700)
    //static let gray750 = Color(uiColor: _gray750)
    //static let gray800 = Color(uiColor: _gray800)
    //static let gray850 = Color(uiColor: _gray850)
    //static let gray900 = Color(uiColor: _gray900)
    //static let gray925 = Color(uiColor: _gray925)
    //static let gray950 = Color(uiColor: _gray950)
    //static let gray975 = Color(uiColor: _gray975)
    
    static let _graphBackgroundDark = UIColor(named: "graph_background_dark") ?? UIColor()
    static let graphBackgroundDark = Color(uiColor: _graphBackgroundDark)
    
    static let _graphBackgroundLight = UIColor(named: "graph_background_light") ?? UIColor()
    static let graphBackgroundLight = Color(uiColor: _graphBackgroundLight)
    
    static let _graphBorderDark = UIColor(named: "graph_border_dark") ?? UIColor()
    static let graphBorderDark = Color(uiColor: _graphBorderDark)
    
    static let _graphBorderLight = UIColor(named: "graph_border_light") ?? UIColor()
    static let graphBorderLight = Color(uiColor: _graphBorderLight)
    
    static let _graphLineFillDark = UIColor(named: "graph_line_fill_dark") ?? UIColor()
    static let graphLineFillDark = Color(uiColor: _graphLineFillDark)
    
    static let _graphLineFillLight = UIColor(named: "graph_line_fill_light") ?? UIColor()
    static let graphLineFillLight = Color(uiColor: _graphLineFillLight)
    
    static let _graphTanLineFillDark = UIColor(named: "graph_tan_line_fill_dark") ?? UIColor()
    static let graphTanLineFillDark = Color(uiColor: _graphTanLineFillDark)
    
    static let _graphTanLineFillLight = UIColor(named: "graph_tan_line_fill_light") ?? UIColor()
    static let graphTanLineFillLight = Color(uiColor: _graphTanLineFillLight)
    
    static let _graphPointFillDark = UIColor(named: "graph_point_fill_dark") ?? UIColor()
    static let graphPointFillDark = Color(uiColor: _graphPointFillDark)
    
    static let _graphPointFillLight = UIColor(named: "graph_point_fill_light") ?? UIColor()
    static let graphPointFillLight = Color(uiColor: _graphPointFillLight)
    
    static let _graphTanPointFillDark = UIColor(named: "graph_tan_point_fill_dark") ?? UIColor()
    static let graphTanPointFillDark = Color(uiColor: _graphTanPointFillDark)
    
    static let _graphTanPointFillLight = UIColor(named: "graph_tan_point_fill_light") ?? UIColor()
    static let graphTanPointFillLight = Color(uiColor: _graphTanPointFillLight)
    
    static let _graphLineStrokeDark = UIColor(named: "graph_line_stroke_dark") ?? UIColor()
    static let graphLineStrokeDark = Color(uiColor: _graphLineStrokeDark)
    
    static let _graphLineStrokeLight = UIColor(named: "graph_line_stroke_light") ?? UIColor()
    static let graphLineStrokeLight = Color(uiColor: _graphLineStrokeLight)
    
    static let _toolbarBackground = UIColor.clear//.withAlphaComponent(0.05)
    static let toolbarBackground = Color(uiColor: _toolbarBackground)
    
    static let _primaryEnabledDark = UIColor(named: "tool_primary_enabled_dark") ?? UIColor()
    static let primaryEnabledDark = Color(uiColor: _primaryEnabledDark)
    
    static let _primaryDisabledDark = UIColor(named: "tool_primary_disabled_dark") ?? UIColor()
    static let primaryDisabledDark = Color(uiColor: _primaryDisabledDark)
    
    static let _primaryEnabledLight = UIColor(named: "tool_primary_enabled_light") ?? UIColor()
    static let primaryEnabledLight = Color(uiColor: _primaryEnabledLight)
    
    static let _primaryDisabledLight = UIColor(named: "tool_primary_disabled_light") ?? UIColor()
    static let primaryDisabledLight = Color(uiColor: _primaryDisabledLight)
    
    static let _primaryUnselectedEnabledDark = UIColor(named: "tool_primary_unselected_enabled_dark") ?? UIColor()
    static let primaryUnselectedEnabledDark = Color(uiColor: _primaryUnselectedEnabledDark)
    
    static let _primaryUnselectedDisabledDark = UIColor(named: "tool_primary_unselected_disabled_dark") ?? UIColor()
    static let primaryUnselectedDisabledDark = Color(uiColor: _primaryUnselectedDisabledDark)
    
    static let _primaryUnselectedEnabledLight = UIColor(named: "tool_primary_unselected_enabled_light") ?? UIColor()
    static let primaryUnselectedEnabledLight = Color(uiColor: _primaryUnselectedEnabledLight)
    
    static let _primaryUnselectedDisabledLight = UIColor(named: "tool_primary_unselected_disabled_light") ?? UIColor()
    static let primaryUnselectedDisabledLight = Color(uiColor: _primaryUnselectedDisabledLight)
    
    static let _primaryDownEnabled = UIColor(named: "tool_primary_down_enabled") ?? UIColor()
    static let primaryDownEnabled = Color(uiColor: _primaryDownEnabled)
    
    static let _primaryDownDisabled = UIColor(named: "tool_primary_down_disabled") ?? UIColor()
    static let primaryDownDisabled = Color(uiColor: _primaryDownDisabled)
    //
    ////
    //
    static let _checkBoxDisabled = UIColor(named: "tool_check_box_disabled") ?? UIColor()
    static let checkBoxDisabled = Color(uiColor: _checkBoxDisabled)
    
    static let _checkBox = UIColor(named: "tool_check_box") ?? UIColor()
    static let checkBox = Color(uiColor: _checkBox)
    
    static let _checkMarkDisabled = UIColor(named: "tool_check_mark_disabled") ?? UIColor()
    static let checkMarkDisabled = Color(uiColor: _checkMarkDisabled)
    
    static let _checkMark = UIColor(named: "tool_check_mark") ?? UIColor()
    static let checkMark = Color(uiColor: _checkMark)
    //
    ////
    //
    static let _checkPrimaryUncheckedDisabledLight = UIColor(named: "tool_check_primary_unchecked_disabled_light") ?? UIColor()
    static let checkPrimaryUncheckedDisabledLight = Color(uiColor: _checkPrimaryUncheckedDisabledLight)
    
    static let _checkPrimaryUncheckedLight = UIColor(named: "tool_check_primary_unchecked_light") ?? UIColor()
    static let checkPrimaryUncheckedLight = Color(uiColor: _checkPrimaryUncheckedDisabledLight)
    
    static let _checkPrimaryUncheckedDisabledDark = UIColor(named: "tool_check_primary_unchecked_disabled_dark") ?? UIColor()
    static let checkPrimaryUncheckedDisabledDark = Color(uiColor: _checkPrimaryUncheckedDisabledDark)
    
    static let _checkPrimaryUncheckedDark = UIColor(named: "tool_check_primary_unchecked_dark") ?? UIColor()
    static let checkPrimaryUncheckedDark = Color(uiColor: _checkPrimaryUncheckedDisabledDark)
    //
    ////
    //
    static let _contextUnderlayDisabledDark = UIColor(named: "tool_context_underlay_disabled_dark") ?? UIColor()
    static let contextUnderlayDisabledDark = Color(uiColor: _contextUnderlayDisabledDark)
    
    static let _contextUnderlayEnabledDark = UIColor(named: "tool_context_underlay_enabled_dark") ?? UIColor()
    static let contextUnderlayEnabledDark = Color(uiColor: _contextUnderlayEnabledDark)
    
    static let _contextUnderlayDisabledLight = UIColor(named: "tool_context_underlay_disabled_light") ?? UIColor()
    static let contextUnderlayDisabledLight = Color(uiColor: _contextUnderlayDisabledLight)
    
    static let _contextUnderlayEnabledLight = UIColor(named: "tool_context_underlay_enabled_light") ?? UIColor()
    static let contextUnderlayEnabledLight = Color(uiColor: _contextUnderlayEnabledLight)
    //
    ////
    //
    static let _dividerHugeDark = UIColor(named: "tool_divider_huge_dark") ?? UIColor()
    static let dividerHugeDark = Color(uiColor: _dividerHugeDark)
    
    static let _dividerHugeLight = UIColor(named: "tool_divider_huge_light") ?? UIColor()
    static let dividerHugeLight = Color(uiColor: _dividerHugeLight)
    
    static let _dividerTinyDark = UIColor(named: "tool_divider_tiny_dark") ?? UIColor()
    static let dividerTinyDark = Color(uiColor: _dividerTinyDark)
    
    static let _dividerTinyLight = UIColor(named: "tool_divider_tiny_light") ?? UIColor()
    static let dividerTinyLight = Color(uiColor: _dividerTinyLight)
    //
    ////
    //
    static let _contextUnderlayHighlightedDisabledDark = UIColor(named: "tool_context_underlay_highlighted_disabled_dark") ?? UIColor()
    static let contextUnderlayHighlightedDisabledDark = Color(uiColor: _contextUnderlayHighlightedDisabledDark)
    
    static let _contextUnderlayHighlightedEnabledDark = UIColor(named: "tool_context_underlay_highlighted_enabled_dark") ?? UIColor()
    static let contextUnderlayHighlightedEnabledDark = Color(uiColor: _contextUnderlayHighlightedEnabledDark)
    
    static let _contextUnderlayHighlightedDisabledLight = UIColor(named: "tool_context_underlay_highlighted_disabled_light") ?? UIColor()
    static let contextUnderlayHighlightedDisabledLight = Color(uiColor: _contextUnderlayHighlightedDisabledLight)
    
    static let _contextUnderlayHighlightedEnabledLight = UIColor(named: "tool_context_underlay_highlighted_enabled_light") ?? UIColor()
    static let contextUnderlayHighlightedEnabledLight = Color(uiColor: _contextUnderlayHighlightedEnabledLight)
    //
    ////
    //
    static let _contextUnderlayDownDisabledDark = UIColor(named: "tool_context_underlay_down_disabled_dark") ?? UIColor()
    static let contextUnderlayDownDisabledDark = Color(uiColor: _contextUnderlayDownDisabledDark)
    
    static let _contextUnderlayDownEnabledDark = UIColor(named: "tool_context_underlay_down_enabled_dark") ?? UIColor()
    static let contextUnderlayDownEnabledDark = Color(uiColor: _contextUnderlayDownEnabledDark)
    
    static let _contextUnderlayDownDisabledLight = UIColor(named: "tool_context_underlay_down_disabled_light") ?? UIColor()
    static let contextUnderlayDownDisabledLight = Color(uiColor: _contextUnderlayDownDisabledLight)
    
    static let _contextUnderlayDownEnabledLight = UIColor(named: "tool_context_underlay_down_enabled_light") ?? UIColor()
    static let contextUnderlayDownEnabledLight = Color(uiColor: _contextUnderlayDownEnabledLight)
    //
    ////
    //
    static let _sliderFillOnDisabledDark = UIColor(named: "tool_slider_fill_on_disabled_dark") ?? UIColor()
    static let sliderFillOnDisabledDark = Color(uiColor: _sliderFillOnDisabledDark)
    
    static let _sliderFillOnDisabledLight = UIColor(named: "tool_slider_fill_on_disabled_light") ?? UIColor()
    static let sliderFillOnDisabledLight = Color(uiColor: _sliderFillOnDisabledLight)
    
    static let _sliderFillOnEnabledDark = UIColor(named: "tool_slider_fill_on_enabled_dark") ?? UIColor()
    static let sliderFillOnEnabledDark = Color(uiColor: _sliderFillOnEnabledDark)
    
    static let _sliderFillOnEnabledLight = UIColor(named: "tool_slider_fill_on_enabled_light") ?? UIColor()
    static let sliderFillOnEnabledLight = Color(uiColor: _sliderFillOnEnabledLight)
    
    static let _sliderFillOffDisabledDark = UIColor(named: "tool_slider_fill_off_disabled_dark") ?? UIColor()
    static let sliderFillOffDisabledDark = Color(uiColor: _sliderFillOffDisabledDark)
    
    static let _sliderFillOffDisabledLight = UIColor(named: "tool_slider_fill_off_disabled_light") ?? UIColor()
    static let sliderFillOffDisabledLight = Color(uiColor: _sliderFillOffDisabledLight)
    
    static let _sliderFillOffEnabledDark = UIColor(named: "tool_slider_fill_off_enabled_dark") ?? UIColor()
    static let sliderFillOffEnabledDark = Color(uiColor: _sliderFillOffEnabledDark)
    
    static let _sliderFillOffEnabledLight = UIColor(named: "tool_slider_fill_off_enabled_light") ?? UIColor()
    static let sliderFillOffEnabledLight = Color(uiColor: _sliderFillOffEnabledLight)
    
    
    
    
    
    
    static let _createSwatchActiveBackgroundDark = UIColor(named: "create_swatch_active_background_dark") ?? UIColor()
    static let createSwatchActiveBackgroundDark = Color(uiColor: _createSwatchActiveBackgroundDark)
    
    static let _createSwatchActiveBackgroundLight = UIColor(named: "create_swatch_active_background_light") ?? UIColor()
    static let createSwatchActiveBackgroundLight = Color(uiColor: _createSwatchActiveBackgroundLight)
    
    static let _createSwatchActiveBackgroundPressedDark = UIColor(named: "create_swatch_active_background_pressed_dark") ?? UIColor()
    static let createSwatchActiveBackgroundPressedDark = Color(uiColor: _createSwatchActiveBackgroundPressedDark)
    
    static let _createSwatchActiveBackgroundPressedLight = UIColor(named: "create_swatch_active_background_pressed_light") ?? UIColor()
    static let createSwatchActiveBackgroundPressedLight = Color(uiColor: _createSwatchActiveBackgroundPressedLight)
    
    static let _createSwatchActiveBorderDark = UIColor(named: "create_swatch_active_border_dark") ?? UIColor()
    static let createSwatchActiveBorderDark = Color(uiColor: _createSwatchActiveBorderDark)
    
    static let _createSwatchActiveBorderLight = UIColor(named: "create_swatch_active_border_light") ?? UIColor()
    static let createSwatchActiveBorderLight = Color(uiColor: _createSwatchActiveBorderLight)
    
    static let _createSwatchActiveBorderPressedDark = UIColor(named: "create_swatch_active_border_pressed_dark") ?? UIColor()
    static let createSwatchActiveBorderPressedDark = Color(uiColor: _createSwatchActiveBorderPressedDark)
    
    static let _createSwatchActiveBorderPressedLight = UIColor(named: "create_swatch_active_border_pressed_light") ?? UIColor()
    static let createSwatchActiveBorderPressedLight = Color(uiColor: _createSwatchActiveBorderPressedLight)
    
    static let _createSwatchActiveCheckBackgroundDark = UIColor(named: "create_swatch_active_check_background_dark") ?? UIColor()
    static let createSwatchActiveCheckBackgroundDark = Color(uiColor: _createSwatchActiveCheckBackgroundDark)
    
    static let _createSwatchActiveCheckBackgroundLight = UIColor(named: "create_swatch_active_check_background_light") ?? UIColor()
    static let createSwatchActiveCheckBackgroundLight = Color(uiColor: _createSwatchActiveCheckBackgroundLight)
    
    static let _createSwatchActiveCheckBackgroundPressedDark = UIColor(named: "create_swatch_active_check_background_pressed_dark") ?? UIColor()
    static let createSwatchActiveCheckBackgroundPressedDark = Color(uiColor: _createSwatchActiveCheckBackgroundPressedDark)
    
    static let _createSwatchActiveCheckBackgroundPressedLight = UIColor(named: "create_swatch_active_check_background_pressed_light") ?? UIColor()
    static let createSwatchActiveCheckBackgroundPressedLight = Color(uiColor: _createSwatchActiveCheckBackgroundPressedLight)
    
    static let _createSwatchActiveCheckStrokeDark = UIColor(named: "create_swatch_active_check_stroke_dark") ?? UIColor()
    static let createSwatchActiveCheckStrokeDark = Color(uiColor: _createSwatchActiveCheckStrokeDark)
    
    static let _createSwatchActiveCheckStrokeLight = UIColor(named: "create_swatch_active_check_stroke_light") ?? UIColor()
    static let createSwatchActiveCheckStrokeLight = Color(uiColor: _createSwatchActiveCheckStrokeLight)
    
    static let _createSwatchActiveCheckStrokePressedDark = UIColor(named: "create_swatch_active_check_stroke_pressed_dark") ?? UIColor()
    static let createSwatchActiveCheckStrokePressedDark = Color(uiColor: _createSwatchActiveCheckStrokePressedDark)
    
    static let _createSwatchActiveCheckStrokePressedLight = UIColor(named: "create_swatch_active_check_stroke_pressed_light") ?? UIColor()
    static let createSwatchActiveCheckStrokePressedLight = Color(uiColor: _createSwatchActiveCheckStrokePressedLight)
    
    static let _createSwatchActivePrimaryDark = UIColor(named: "create_swatch_active_primary_dark") ?? UIColor()
    static let createSwatchActivePrimaryDark = Color(uiColor: _createSwatchActivePrimaryDark)
    
    static let _createSwatchActivePrimaryLight = UIColor(named: "create_swatch_active_primary_light") ?? UIColor()
    static let createSwatchActivePrimaryLight = Color(uiColor: _createSwatchActivePrimaryLight)
    
    static let _createSwatchActivePrimaryPressedDark = UIColor(named: "create_swatch_active_primary_pressed_dark") ?? UIColor()
    static let createSwatchActivePrimaryPressedDark = Color(uiColor: _createSwatchActivePrimaryPressedDark)
    
    static let _createSwatchActivePrimaryPressedLight = UIColor(named: "create_swatch_active_primary_pressed_light") ?? UIColor()
    static let createSwatchActivePrimaryPressedLight = Color(uiColor: _createSwatchActivePrimaryPressedLight)
    
    
    
    
    static let _separatorPadBarAdjacentDark = UIColor(named: "tool_separator_pad_bar_adjacent_dark") ?? UIColor()
    static let separatorPadBarAdjacentDark = Color(uiColor: _separatorPadBarAdjacentDark)
    
    static let _separatorPadBarAdjacentLight = UIColor(named: "tool_separator_pad_bar_adjacent_light") ?? UIColor()
    static let separatorPadBarAdjacentLight = Color(uiColor: _separatorPadBarAdjacentLight)
    
    
    // Outer is next to the interface
    static let _separatorPhoneInterfaceAdjacentDark = UIColor(named: "tool_separator_phone_interface_adjacent_dark") ?? UIColor()
    static let separatorPhoneInterfaceAdjacentDark = Color(uiColor: _separatorPhoneInterfaceAdjacentDark)
    
    static let _separatorPhoneInterfaceAdjacentLight = UIColor(named: "tool_separator_phone_interface_adjacent_light") ?? UIColor()
    static let separatorPhoneInterfaceAdjacentLight = Color(uiColor: _separatorPhoneInterfaceAdjacentLight)
    
    static let _separatorPhoneSceneAdjacentDark = UIColor(named: "tool_separator_phone_scene_adjacent_dark") ?? UIColor()
    static let separatorPhoneSceneAdjacentDark = Color(uiColor: _separatorPhoneSceneAdjacentDark)
    
    static let _separatorPhoneSceneAdjacentLight = UIColor(named: "tool_separator_phone_scene_adjacent_light") ?? UIColor()
    static let separatorPhoneSceneAdjacentLight = Color(uiColor: _separatorPhoneSceneAdjacentLight)
    
    static let _separatorMiddleDark = UIColor(named: "tool_separator_middle_dark") ?? UIColor()
    static let separatorMiddleDark = Color(uiColor: _separatorMiddleDark)
    
    static let _separatorMiddleLight = UIColor(named: "tool_separator_middle_light") ?? UIColor()
    static let separatorMiddleLight = Color(uiColor: _separatorMiddleDark)
    
    
    static let _shadowInner = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
    static let shadowInner = Color(uiColor: _shadowInner)
    
    static let _shadowMiddle = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15)
    static let shadowMiddle = Color(uiColor: _shadowMiddle)
    
    static let _shadowOuter = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    static let shadowOuter = Color(uiColor: _shadowOuter)
    
    static let graphCurveStrokeThickness = CGFloat(Device.isPad ? 6.0 : 4.0)
    static let graphCurveFillThickness = CGFloat(Device.isPad ? 4.0 : 2.5)
    
    static let graphTanLineStrokeThickness = CGFloat(Device.isPad ? 5.0 : 4.0)
    static let graphTanLineFillThickness = CGFloat(Device.isPad ? 3.0 : 2.5)
    
    
    static let greenButtonFill = Color(uiColor: _greenButtonFill)
    static let greenButtonFillDisabled = Color(uiColor: _greenButtonFillDisabled)
    
    static let greenButtonFillDown = Color(uiColor: _greenButtonFillDown)
    static let greenButtonFillDownDisabled = Color(uiColor: _greenButtonFillDownDisabled)
}
