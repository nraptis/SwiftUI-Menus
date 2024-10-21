//
//  ToolInterfaceElementFlex.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

struct FlexFavoringOneLineLabelData {
    let squeezedOneLineWidth: Int
    let standardOneLineWidth: Int
    let relaxedOneLineWidth: Int
    
    let squeezedTwoLineWidth: Int
    let standardTwoLineWidth: Int
    let relaxedTwoLineWidth: Int
}

struct FlexConvertibleData {
    let squeezedWidthLong: Int
    let standardWidthLong: Int
    let relaxedWidthLong: Int
    
    let squeezedWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let relaxedWidthStackedLarge: Int
    
    let squeezedWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let relaxedWidthStackedMedium: Int
    
    let squeezedWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let relaxedWidthStackedSmall: Int
}

struct FlexLongData {
    let squeezedWidthLarge: Int
    let standardWidthLarge: Int
    let relaxedWidthLarge: Int
    
    let squeezedWidthMedium: Int
    let standardWidthMedium: Int
    let relaxedWidthMedium: Int
    
    let squeezedWidthSmall: Int
    let standardWidthSmall: Int
    let relaxedWidthSmall: Int
}

struct FlexStepperData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let relaxedWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let relaxedWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let relaxedWidthSmall: Int
}

struct FlexSpacerData {
    let defaultWidth: Int
}

struct FlexDividerSpacerDividerData {
    let minimumWidth: Int
    let standardWidth: Int
}

enum ToolInterfaceElementFlex {
    case fixed(Int)
    
    case spacer(FlexSpacerData)
    
    case dividerSpacerDivider(FlexDividerSpacerDividerData)
    
    case segment(FlexConvertibleData)
    case button(FlexConvertibleData)
    case checkBox(FlexConvertibleData)
    
    case greenButton(FlexLongData)
    case mainTab(FlexLongData)
    case createSwatch(FlexLongData)
    
    case slider(FlexLongData, ToolInterfaceElementSliderWidthCategory)
    
    case favoringOneLineLabel(FlexFavoringOneLineLabelData)
    
    case enterMode(FlexConvertibleData)
    case exitMode(FlexConvertibleData)
    case stepper(FlexConvertibleData)
}
