//
//  JiggleViewController+GestureViewDelegate.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/4/24.
//

import UIKit

extension JiggleViewController: GestureViewDelegate {
    
    func allGestureRecognizersWereCancelled() {
        jiggleScene.allGestureRecognizersWereCancelled()
    }
    
    func allTouchesWereCancelled(touches: [UITouch], points: [Math.Point]) {
        jiggleScene.allTouchesWereCancelled(touches: touches,
                                            points: points)
    }
    
    func gestureRecognizerShouldBegin(point: Math.Point) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldReceiveTouch(point: Math.Point) -> Bool {
        
        let cgPoint = point.cgPoint
        if Device.isPad {
            if padDraggableMenu.frame.contains(cgPoint) {
                return false
            }
            let cgPoint = point.cgPoint
            let pointX = cgPoint.x
            let pointY = cgPoint.y
            let cgPointTransformed = CGPoint(x: pointX - padDraggableMenuLeftConstraint.constant,
                                             y: pointY - padDraggableMenuTopConstraint.constant)
            if padDraggableMenu.isNearCornerTopLeft(cgPointTransformed) {
                return false
            }
            if padDraggableMenu.isNearCornerTopRight(cgPointTransformed) {
                return false
            }
            if padDraggableMenu.isNearCornerBottomLeft(cgPointTransformed) {
                return false
            }
            if padDraggableMenu.isNearCornerBottomRight(cgPointTransformed) {
                return false
            }
        } else {
            if phoneTopMenu.frame.contains(cgPoint) {
                return false
            }
            if phoneBottomMenu.frame.contains(cgPoint) {
                return false
            }
        }
        
        return true
    }
    
    func attemptPanBegan(center: Math.Point, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptPanBegan(center: center, numberOfTouches: numberOfTouches)
    }
    
    func attemptPanMoved(center: Math.Point, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptPanMoved(center: center, numberOfTouches: numberOfTouches)
    }
    
    func attemptPanEnded(center: Math.Point, releaseDir: Math.Vector, releaseMagnitude: Float) -> Bool {
        return jiggleScene.attemptPanEnded(center: center, releaseDir: releaseDir,
                                           releaseMagnitude: releaseMagnitude)
    }
    
    func attemptPinchBegan(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptPinchBegan(center: center, scale: scale,
                                             numberOfTouches: numberOfTouches)
    }
    
    func attemptPinchMoved(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptPinchMoved(center: center, scale: scale,
                                             numberOfTouches: numberOfTouches)
    }
    
    func attemptPinchEnded(center: Math.Point, scale: Float) -> Bool {
        return jiggleScene.attemptPinchEnded(center: center,
                                             scale: scale)
    }
    
    func attemptRotateBegan(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptRotateBegan(center: center, rotation: rotation,
                                              numberOfTouches: numberOfTouches)
    }
    
    func attemptRotateMoved(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool {
        return jiggleScene.attemptRotateMoved(center: center, rotation: rotation,
                                              numberOfTouches: numberOfTouches)
    }
    
    func attemptRotateEnded(center: Math.Point, rotation: Float) -> Bool {
        return jiggleScene.attemptRotateEnded(center: center, rotation: rotation)
    }
    
    func touchesBegan(touches: [UITouch], points: [Math.Point], allTouchCount: Int) {
        
        if Device.isPad {
            
            let orientation = jiggleDocument.orientation
            
            for touchIndex in 0..<touches.count {
                let touch = touches[touchIndex]
                let point = points[touchIndex]
                
                if dragTabletInterfaceMenuTouch === nil && resizeTabletInterfaceMenuTouch === nil {
                    
                    let cgPoint = point.cgPoint
                    
                    let pointX = cgPoint.x
                    let pointY = cgPoint.y
                    
                    let cgPointTransformed = CGPoint(x: pointX - padDraggableMenuLeftConstraint.constant,
                                                     y: pointY - padDraggableMenuTopConstraint.constant)
                    
                    if padDraggableMenu.isNearCornerTopLeft(cgPointTransformed) {
                        resizeTabletInterfaceMenuTouch = touch
                        resizeTabletInterfaceMenuCorner = .topLeft
                        resizeTabletInterfaceMenuStartX = padDraggableMenuLeftConstraint.constant
                        resizeTabletInterfaceMenuStartWidth = padDraggableMenuWidthConstraint.constant
                        resizeTabletInterfaceMenuStartTouchX = pointX
                        return
                    }
                    
                    if padDraggableMenu.isNearCornerTopRight(cgPointTransformed) {
                        resizeTabletInterfaceMenuTouch = touch
                        resizeTabletInterfaceMenuCorner = .topRight
                        resizeTabletInterfaceMenuStartX = padDraggableMenuLeftConstraint.constant
                        resizeTabletInterfaceMenuStartWidth = padDraggableMenuWidthConstraint.constant
                        resizeTabletInterfaceMenuStartTouchX = pointX
                        return
                    }
                    
                    if padDraggableMenu.isNearCornerBottomLeft(cgPointTransformed) {
                        resizeTabletInterfaceMenuTouch = touch
                        resizeTabletInterfaceMenuCorner = .bottomLeft
                        resizeTabletInterfaceMenuStartX = padDraggableMenuLeftConstraint.constant
                        resizeTabletInterfaceMenuStartWidth = padDraggableMenuWidthConstraint.constant
                        resizeTabletInterfaceMenuStartTouchX = pointX
                        return
                    }
                    
                    if padDraggableMenu.isNearCornerBottomRight(cgPointTransformed) {
                        resizeTabletInterfaceMenuTouch = touch
                        resizeTabletInterfaceMenuCorner = .bottomRight
                        resizeTabletInterfaceMenuStartX = padDraggableMenuLeftConstraint.constant
                        resizeTabletInterfaceMenuStartWidth = padDraggableMenuWidthConstraint.constant
                        resizeTabletInterfaceMenuStartTouchX = pointX
                        return
                    }
                    
                    let topFrameLeft = padDraggableMenuLeftConstraint.constant
                    let topFrameRight = topFrameLeft + padDraggableMenuWidthConstraint.constant
                    let topFrameTop = padDraggableMenuTopConstraint.constant
                    let draggableTopToolbarHeight = ToolInterfaceTheme.getDraggableMenuTopToolbarHeight()
                    let topFrameBottom = topFrameTop + CGFloat(draggableTopToolbarHeight)
                    
                    if pointX >= topFrameLeft && pointX <= topFrameRight && pointY >= topFrameTop && pointY <= topFrameBottom {
                        dragTabletInterfaceMenuTouch = touch
                        dragTabletInterfaceMenuStartX = topFrameLeft
                        dragTabletInterfaceMenuStartY = topFrameTop
                        dragTabletInterfaceMenuStartTouchX = pointX
                        dragTabletInterfaceMenuStartTouchY = pointY
                        return
                    }
                    
                    let draggableBottomToolbarHeight = ToolInterfaceTheme.getDraggableMenuBottomToolbarHeight()
                    let bottomFrameTop = topFrameTop + padDraggableMenuHeightConstraint.constant - CGFloat(draggableBottomToolbarHeight)
                    let bottomFrameBottom = bottomFrameTop + CGFloat(draggableBottomToolbarHeight)
                    if pointX >= topFrameLeft && pointX <= topFrameRight && pointY >= bottomFrameTop && pointY <= bottomFrameBottom {
                        dragTabletInterfaceMenuTouch = touch
                        dragTabletInterfaceMenuStartX = topFrameLeft
                        dragTabletInterfaceMenuStartY = topFrameTop
                        dragTabletInterfaceMenuStartTouchX = pointX
                        dragTabletInterfaceMenuStartTouchY = pointY
                        return
                    }
                }
            }
        }
        
        jiggleScene.touchesBegan(touches: touches,
                                 points: points,
                                 allTouchCount: allTouchCount)
    }
    
    func touchesMoved(touches: [UITouch], points: [Math.Point], isFromRelease: Bool, allTouchCount: Int) {
        
        
        
        for touchIndex in 0..<touches.count {
            let touch = touches[touchIndex]
            let point = points[touchIndex]
            
            if resizeTabletInterfaceMenuTouch !== nil {
                
                
                if touch === resizeTabletInterfaceMenuTouch {
                    
                    let pointX = CGFloat(point.x)
                    
                    let diffX = pointX - resizeTabletInterfaceMenuStartTouchX
                    
                    let rootView = ApplicationController.rootViewController.view ?? UIView()
                    
                    let minWidth = CGFloat(DraggableMenuView.getMinimumWidth(orientation: jiggleDocument.orientation))
                    let maxWidth = CGFloat(DraggableMenuView.getMaximumWidth(orientation: jiggleDocument.orientation))
                    
                    let minX = rootView.safeAreaInsets.left
                    let maxX = rootView.bounds.size.width - (rootView.safeAreaInsets.right)
                    
                    let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: jiggleDocument.orientation)
                    
                    if resizeTabletInterfaceMenuCorner == .topRight || resizeTabletInterfaceMenuCorner == .bottomRight {
                        var newWidth = resizeTabletInterfaceMenuStartWidth + diffX
                        
                        if newWidth > maxWidth { newWidth = maxWidth }
                        if newWidth < minWidth { newWidth = minWidth }
                        
                        if resizeTabletInterfaceMenuStartX + newWidth > maxX {
                            newWidth = (maxX - resizeTabletInterfaceMenuStartX)
                        }
                        
                        padDraggableMenuWidthConstraint.constant = newWidth
                        
                        let newWidthI = Int(newWidth + 0.5)
                        jiggleViewModel.toolInterfaceViewModel.layoutAllRowsTablet(menuWidthWithSafeArea: newWidthI,
                                                                                   rowHeight:  rowHeight,
                                                                                   safeAreaLeft: 0,
                                                                                   safeAreaRight: 0)
                        
                        registerGraphFrame()
                        registerTimeLineFrame()
                        
                        return
                    } else {
                        
                        // The rightX never moves here, we drag the left...
                        let rightX = resizeTabletInterfaceMenuStartX + resizeTabletInterfaceMenuStartWidth
                        
                        var newX = resizeTabletInterfaceMenuStartX + diffX
                        if newX < minX { newX = minX }
                        
                        var newWidth = rightX - newX
                        if newWidth > maxWidth {
                            newX = rightX - maxWidth
                            newWidth = maxWidth
                        }
                        
                        if newWidth < minWidth {
                            newX = rightX - minWidth
                            newWidth = minWidth
                        }
                        
                        padDraggableMenuLeftConstraint.constant = newX
                        padDraggableMenuWidthConstraint.constant = newWidth
                        
                        let newWidthI = Int(newWidth + 0.5)
                        
                        jiggleViewModel.toolInterfaceViewModel.layoutAllRowsTablet(menuWidthWithSafeArea: newWidthI,
                                                                                   rowHeight:  rowHeight,
                                                                                   safeAreaLeft: 0,
                                                                                   safeAreaRight: 0)
                        
                        registerGraphFrame()
                        registerTimeLineFrame()
                        
                        return
                    }
                }
            }
            
            if dragTabletInterfaceMenuTouch !== nil {
                if touch === dragTabletInterfaceMenuTouch {
                    let pointX = CGFloat(point.x)
                    let pointY = CGFloat(point.y)
                    
                    let diffX = pointX - dragTabletInterfaceMenuStartTouchX
                    let diffY = pointY - dragTabletInterfaceMenuStartTouchY
                    
                    let menuWidth = padDraggableMenuWidthConstraint.constant
                    let menuHeight = MenuHeightCategoryPad.get(category: .standard,
                                                               orientation: jiggleDocument.orientation,
                                                               isExpanded: false)
                    
                    var newX = dragTabletInterfaceMenuStartX + diffX
                    var newY = dragTabletInterfaceMenuStartY + diffY
                    
                    let rootView = ApplicationController.rootViewController.view ?? UIView()
                    
                    let minX = rootView.safeAreaInsets.left
                    let maxX = rootView.bounds.size.width - (menuWidth + rootView.safeAreaInsets.right)
                    let minY = rootView.safeAreaInsets.top
                    let maxY = rootView.bounds.size.height - (CGFloat(menuHeight) + rootView.safeAreaInsets.bottom)
                    
                    if newX < minX { newX = minX }
                    if newX > maxX { newX = maxX }
                    if newY < minY { newY = minY }
                    if newY > maxY { newY = maxY }
                    
                    padDraggableMenuLeftConstraint.constant = newX
                    padDraggableMenuTopConstraint.constant = newY
                    
                    return
                }
            }
        }
        
        jiggleScene.touchesMoved(touches: touches,
                                 points: points,
                                 isFromRelease: isFromRelease,
                                 allTouchCount: allTouchCount)
    }
    
    func touchesEnded(touches: [UITouch], 
                      points: [Math.Point],
                      allTouchCount: Int) {
        jiggleScene.touchesEnded(touches: touches,
                                 points: points,
                                 allTouchCount: allTouchCount)
        dragTabletInterfaceMenuTouch = nil
        resizeTabletInterfaceMenuTouch = nil
    }
    
    func handleDoubleTap(center: Math.Point, numberOfTouches: Int) {
        
        if Device.isPad { return }
        
        if jiggleViewModel.toolInterfaceViewModel.isBlocked { return }
        
        let interfaceConfigurationPrevious = toolInterfaceViewModel.getCurrentInterfaceConfigurationPhone()
        //var interfaceConfigurationCurrent = interfaceConfigurationPrevious
        //let time = Self.getExpandCollapseAnimationTime(orientation: jiggleDocument.orientation)
        
        let expandCollapseSlices: [ToolActionPhaseSlice]
        if (interfaceConfigurationPrevious.isExpandedTop == true) && (interfaceConfigurationPrevious.isExpandedBottom == true) {
            // Collapse both top and bottom.
            let toolAction = batchInterfaceAction { interfaceConfiguration in
                interfaceConfiguration.isExpandedTop = false
                interfaceConfiguration.isExpandedBottom = false
                return [
                    ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: false),
                    ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: false)
                ]
            } alongsideMeshCommand: {
                [ ]
            }
            toolActionPerform(toolAction)
            
        } else if (interfaceConfigurationPrevious.isExpandedTop == false) && (interfaceConfigurationPrevious.isExpandedBottom == false) {
            // Expand both top and bottom.
            
            let toolAction = batchInterfaceAction { interfaceConfiguration in
                interfaceConfiguration.isExpandedTop = true
                interfaceConfiguration.isExpandedBottom = true
                return [
                    ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: true),
                    ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: true)
                ]
            } alongsideMeshCommand: {
                [ ]
            }
            toolActionPerform(toolAction)
            
            
        } else if (interfaceConfigurationPrevious.isExpandedTop == true) {
            // Collapse top only.
            let toolAction = batchInterfaceAction { interfaceConfiguration in
                interfaceConfiguration.isExpandedTop = false
                return [
                    ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: false)
                ]
            } alongsideMeshCommand: {
                [ ]
            }
            toolActionPerform(toolAction)
            
        } else {
            // Collapse bottom only.
            
            let toolAction = batchInterfaceAction { interfaceConfiguration in
                interfaceConfiguration.isExpandedBottom = false
                return [
                    ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: false)
                ]
            } alongsideMeshCommand: {
                [ ]
            }
            toolActionPerform(toolAction)
        }
        
        
        /*
        let phaseSliceInterface = ToolActionPhaseSliceUpdateInterfaceConfigurationPhone(interfaceConfigurationPrevious: interfaceConfigurationPrevious,
                                                                                   interfaceConfigurationCurrent: interfaceConfigurationCurrent)
        
        var slices = [ToolActionPhaseSlice]()
        slices.append(contentsOf: expandCollapseSlices)
        slices.append(phaseSliceInterface)
        
        let phase = ToolActionPhase(slices: slices,
                                    time: time)
        let toolAction = ToolAction(phase: phase)
        toolActionPerform(toolAction)
        */
           
        
    }
}
