//
//  ToolInterfaceElementFlex.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

struct FlexSegmentData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

struct FlexMainTabData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexCreateSwatchData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexEnterModeData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexExitModeData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexSliderData {
    
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexSpacerData {
    let defaultWidth: Int
}

struct FlexDividerSpacerDividerData {
    let minimumWidth: Int
    let standardWidth: Int
}

struct FlexTextIconButtonData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

struct FlexSexyButtonData {
    let minimumWidthLarge: Int
    let standardWidthLarge: Int
    let maximumWidthLarge: Int
    
    let minimumWidthMedium: Int
    let standardWidthMedium: Int
    let maximumWidthMedium: Int
    
    let minimumWidthSmall: Int
    let standardWidthSmall: Int
    let maximumWidthSmall: Int
}

struct FlexGreenButtonData {
    let minimumWidth: Int
    let standardWidth: Int
    let maximumWidth: Int
}

struct FlexIconButtonData {
    let minimumWidth: Int
    let standardWidth: Int
    let maximumWidth: Int
}

struct FlexCheckBoxData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

struct FlexFavoringOneLineLabelData {
    let minimumWidth: Int
    let twoLineWidth: Int
    let oneLineWidth: Int
    let oneLineWidthPadded: Int
}

enum ToolInterfaceElementFlex {
    case fixed(Int)
    
    case spacer(FlexSpacerData)
    
    case dividerSpacerDivider(FlexDividerSpacerDividerData)
    
    case iconButton(FlexIconButtonData)
    case textIconButton(FlexTextIconButtonData)
    case sexyButton(FlexSexyButtonData)
    
    case greenButton(FlexGreenButtonData)
    
    case segment(FlexSegmentData)
    case mainTab(FlexMainTabData)
    case createSwatch(FlexCreateSwatchData)
    
    case slider(FlexSliderData)
    
    case checkBox(FlexCheckBoxData)
    
    case favoringOneLineLabel(FlexFavoringOneLineLabelData)
    
    case enterMode(FlexEnterModeData)
    case exitMode(FlexExitModeData)
    
}
