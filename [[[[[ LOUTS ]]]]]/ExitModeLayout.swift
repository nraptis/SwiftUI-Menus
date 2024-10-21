//
//  ExitModeLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import UIKit

struct ExitModeLayout: LayoutScheme {
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        EnterModeLayout.getNameLabelVerticalSpacing(orientation: orientation, flavor: flavor)
    }
    
    // [++] Final
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        EnterModeLayout.getValueLabelFont(orientation: orientation, flavor: flavor)
    }
    
    // [++] Final
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        EnterModeLayout.getOutsideBoxPaddingTop(orientation: orientation)
    }
    
    // [++] Final
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        EnterModeLayout.getOutsideBoxPaddingBottom(orientation: orientation)
    }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        EnterModeLayout.getHeroPaddingTopStacked(orientation: orientation, numberOfLines: numberOfLines)
    }
    
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        EnterModeLayout.getHeroPaddingBottomStacked(orientation: orientation, numberOfLines: numberOfLines)
    }
    
    // [++] Final
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        EnterModeLayout.getNameLabelFont(orientation: orientation, flavor: flavor)
    }
    
    // [++] Final
    static func getCornerRadius(orientation: Orientation) -> Int {
        EnterModeLayout.getCornerRadius(orientation: orientation)
    }
    
    // [++] Final
    static func getLineThickness(orientation: Orientation) -> Int {
        EnterModeLayout.getLineThickness(orientation: orientation)
    }
    
}