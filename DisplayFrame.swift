//
//  DisplayFrame.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/6/24.
//

import Foundation

struct DisplayFrame {
    
    let clipFrameX: Int
    let clipFrameY: Int
    let clipFrameWidth: Int
    let clipFrameHeight: Int
    
    let contentFrameX: Int
    let contentFrameY: Int
    let contentFrameWidth: Int
    let contentFrameHeight: Int
    
    @MainActor static func with(configuration: InterfaceConfigurationConforming,
                     orientation: Orientation,
                     safeAreaLeft: Int,
                     safeAreaRight: Int,
                     safeAreaTop: Int,
                     safeAreaBottom: Int,
                     phoneMenuCollapseOffset: Int) -> DisplayFrame {
        
        let appWidth: Int
        let appHeight: Int
        switch orientation {
        case .landscape:
            appWidth = Int(ApplicationController.widthLandscape + 0.5)
            appHeight = Int(ApplicationController.heightLandscape + 0.5)
        case .portrait:
            appWidth = Int(ApplicationController.widthPortrait + 0.5)
            appHeight = Int(ApplicationController.heightPortrait + 0.5)
        }
        
        var contentTop = 0
        var contentBottom = appHeight
        
        if let configurationPhone = configuration as? InterfaceConfigurationPhone {
            
            if configurationPhone.isExpandedTop {
                let topMenuHeight = MenuHeightCategoryPhoneTop.get(category: configurationPhone.heightCategoryTop,
                                                                   orientation: orientation)
                contentTop = safeAreaTop + topMenuHeight
            } else {
                contentTop = (-phoneMenuCollapseOffset)
            }
            
            if configurationPhone.isExpandedBottom {
                let bottomMenuHeight = MenuHeightCategoryPhoneBottom.get(category: configurationPhone.heightCategoryBottom,
                                                                         orientation: orientation)
                contentBottom = appHeight - (safeAreaBottom + bottomMenuHeight)
                
            } else {
                contentBottom = appHeight + phoneMenuCollapseOffset
            }
        }
        
        let contentFrameWidth = (appWidth - (safeAreaLeft + safeAreaRight))
        let contentFrameHeight = (contentBottom - contentTop)
        return DisplayFrame(clipFrameX: 0, clipFrameY: 0, clipFrameWidth: appWidth, clipFrameHeight: appHeight,
                            contentFrameX: safeAreaLeft,
                            contentFrameY: contentTop,
                            contentFrameWidth: contentFrameWidth,
                            contentFrameHeight: contentFrameHeight)
    }
}

extension DisplayFrame: Equatable { }
