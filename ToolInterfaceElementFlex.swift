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
    let squeezedWidth: Int
    let standardWidth: Int
    let relaxedWidth: Int
}

struct FlexSexyStepperData {
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

struct FlexSegmentData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let relaxedWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let relaxedWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let relaxedWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let relaxedWidthStackedSmall: Int
}

struct FlexMainTabData {
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

struct FlexCreateSwatchData {
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

struct FlexEnterModeData {
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

struct FlexSexyCheckBoxData {
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

struct FlexExitModeData {
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

struct FlexSliderData {
    
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    
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

struct FlexGreenButtonData {
    let minimumWidth: Int
    let standardWidth: Int
    let relaxedWidth: Int
}

struct FlexIconButtonData {
    let minimumWidth: Int
    let standardWidth: Int
    let relaxedWidth: Int
}

struct FlexCheckBoxData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let relaxedWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let relaxedWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let relaxedWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let relaxedWidthStackedSmall: Int
}

enum ToolInterfaceElementFlex {
    case fixed(Int)
    
    case spacer(FlexSpacerData)
    
    case dividerSpacerDivider(FlexDividerSpacerDividerData)
    
    case iconButton(FlexIconButtonData)
    
    case segment(FlexConvertibleData)
    
    case textIconButton(FlexConvertibleData)
    case sexyButton(FlexConvertibleData)
    case sexyCheckBox(FlexConvertibleData)
    
    case greenButton(FlexLongData)
    
    case mainTab(FlexMainTabData)
    case createSwatch(FlexCreateSwatchData)
    
    case slider(FlexSliderData)
    
    case checkBox(FlexCheckBoxData)
    
    case favoringOneLineLabel(FlexFavoringOneLineLabelData)
    
    case enterMode(FlexConvertibleData)
    case exitMode(FlexConvertibleData)
    
    case sexyStepper(FlexSexyStepperData)
    
}
