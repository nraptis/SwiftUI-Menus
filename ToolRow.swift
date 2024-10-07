//
//  ToolRow.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/13/24.
//

import Foundation
import UIKit
import Combine

//[View Models - SexyButton]
//[SwiftUI - CreateSwatch]
//[Elements - SexyButton]

class ToolRow {
    
    var updatePublisher = PassthroughSubject<Void, Never>()
    
    let slot: ToolRowSlot
    var configuration = ToolRowConfiguration.unknown
    
    var nodesDidChangePublisher_NotAnimated = PassthroughSubject<Void, Never>()
    var nodesDidChangePublisher_AnimatedStep1 = PassthroughSubject<Bool, Never>()
    var nodesDidChangePublisher_AnimatedStep2 = PassthroughSubject<(Bool, CGFloat), Never>()
    
    var _widthConstraint: NSLayoutConstraint?
    func getWidthConstraint(_ view: UIView) -> NSLayoutConstraint {
        if let result = _widthConstraint {
            return result
        }
        let result = NSLayoutConstraint(item: view,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1.0,
                                        constant: 320.0)
        _widthConstraint = result
        return result
    }
    
    var _leftConstraint: NSLayoutConstraint?
    func getLeftConstraint(_ view: UIView, _ parent: UIView) -> NSLayoutConstraint {
        if let result = _leftConstraint {
            return result
        }
        let result = NSLayoutConstraint(item: view,
                                        attribute: .left,
                                        relatedBy: .equal,
                                        toItem: parent,
                                        attribute: .left,
                                        multiplier: 1.0, constant: 0.0)
        _leftConstraint = result
        return result
    }
    
    private(set) var previousNodes = [ToolNode]()
    private(set) var nodes = [ToolNode]()
    private(set) var centerPinnedElement: ToolInterfaceElement?
    
    @MainActor func refreshAllNodes() {
        for node in nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    var isRowAnimationActive = false
    
    @MainActor func setNodes_NotAnimated(_ nodes: [ToolNode],
                                         orientation: Orientation,
                                         menuWidthWithSafeArea: Int,
                                         height: Int,
                                         safeAreaLeft: Int,
                                         safeAreaRight: Int,
                                         centerPinnedElement: ToolInterfaceElement?) {
        
        let width = (menuWidthWithSafeArea - safeAreaLeft - safeAreaRight)
        let layoutStackingCategory = ToolInterfaceViewModel.calculateLayoutStackingCategory(orientation: orientation,
                                                                                            width: width,
                                                                                            height: height,
                                                                                            nodes: nodes,
                                                                                            centerPinnedElement: centerPinnedElement,
                                                                                            slot: slot)
        
        isRowAnimationActive = false
        removePreviousNodes()
        removeNodes()
        let nodeCount = nodes.count
        for nodeIndex in 0..<nodeCount {
            let node = nodes[nodeIndex]
            self.nodes.append(node)
        }
        self.centerPinnedElement = centerPinnedElement
        for node in nodes {
            if node.element == centerPinnedElement {
                node.isCenterPinned = true
                break
            }
        }
        layout(orientation: orientation,
               menuWidthWithSafeArea: menuWidthWithSafeArea,
               height: height,
               safeAreaLeft: safeAreaLeft,
               safeAreaRight: safeAreaRight)
        nodesDidChangePublisher_NotAnimated.send(())
    }
    
    @MainActor func setNodes_AnimatedStep1(_ nodes: [ToolNode],
                                           orientation: Orientation,
                                           reversed: Bool,
                                           menuWidthWithSafeArea: Int,
                                           height: Int,
                                           safeAreaLeft: Int,
                                           safeAreaRight: Int,
                                           centerPinnedElement: ToolInterfaceElement?) {
        
        let width = (menuWidthWithSafeArea - safeAreaLeft - safeAreaRight)
        let layoutStackingCategory = ToolInterfaceViewModel.calculateLayoutStackingCategory(orientation: orientation,
                                                                                            width: width,
                                                                                            height: height,
                                                                                            nodes: nodes,
                                                                                            centerPinnedElement: centerPinnedElement,
                                                                                            slot: slot)
        
        isRowAnimationActive = true
        removePreviousNodes()
        for node in self.nodes {
            previousNodes.append(node)
        }
        removeNodes()
        let nodeCount = nodes.count
        for nodeIndex in 0..<nodeCount {
            let node = nodes[nodeIndex]
            self.nodes.append(node)
        }
        self.centerPinnedElement = centerPinnedElement
        for node in nodes {
            if node.element == centerPinnedElement {
                node.isCenterPinned = true
                break
            }
        }
        layout(orientation: orientation,
               menuWidthWithSafeArea: menuWidthWithSafeArea,
               height: height,
               safeAreaLeft: safeAreaLeft,
               safeAreaRight: safeAreaRight)
        nodesDidChangePublisher_AnimatedStep1.send(reversed)
    }
    
    @MainActor func setNodes_AnimatedStep2(reversed: Bool,
                                           time: CGFloat) {
        nodesDidChangePublisher_AnimatedStep2.send((reversed, time))
    }
    
    func getCenterPinnedNode() -> ToolNode? {
        if let centerPinnedElement = centerPinnedElement {
            for node in nodes {
                if node.element == centerPinnedElement {
                    return node
                }
            }
        }
        return nil
    }
    
    static func getCenterPinnedNode(centerPinnedElement: ToolInterfaceElement?, nodes: [ToolNode]) -> ToolNode? {
        if let centerPinnedElement = centerPinnedElement {
            for node in nodes {
                if node.element == centerPinnedElement {
                    return node
                }
            }
        }
        return nil
    }
    
    func removePreviousNodes() {
        previousNodes.removeAll(keepingCapacity: true)
    }
    
    func removeNodes() {
        nodes.removeAll(keepingCapacity: true)
    }
    
    init(slot: ToolRowSlot) {
        self.slot = slot
    }
    
    class LayoutNode {
        
        static func getAllWidthClassesInOrder() -> [WidthClass] {
            return [.high, .medium, .low]
        }
        
        enum WidthClass {
            case high
            case medium
            case low
        }
        var x = 0
        var width = 0
        var layoutWidthHigh = 0
        var layoutWidthMedium = 0
        var layoutWidthLow = 0
        var minimumWidth = 0
        var isShrinkable = false
        var isSpacer = false
        func getWidth(`class`: WidthClass) -> Int {
            switch `class` {
            case .high:
                return layoutWidthHigh
            case .medium:
                return layoutWidthMedium
            case .low:
                return layoutWidthLow
            }
        }
        
    }
    
    // Grow the "width" of each node, possibly shrinking node...
    @discardableResult private func cram(layoutNodes: [LayoutNode], into space: Int) -> Int {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            shrink(layoutNodes: layoutNodes, into: space)
        } else if consumedWidth < space {
            grow(layoutNodes: layoutNodes, into: space)
            
        }
        consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        return consumedWidth
    }
    
    // In this case, we *are* over-sized, let's grow as small as we can.
    private func shrink(layoutNodes: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth <= space {
            print("FATAL!!! Shrink ***MUST*** exceed width already... Bad usage!!!")
            print("Nodes has \(layoutNodes.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        var fudge = 0
        var reloop = true
        
        while fudge < 2048 && reloop == true {
            reloop = false
            if consumedWidth > space {
                for layoutNode in layoutNodes {
                    if layoutNode.isShrinkable {
                        if layoutNode.width > 0 && consumedWidth > space {
                            layoutNode.width -= 1
                            consumedWidth -= 1
                            reloop = true
                        }
                    }
                }
            }
            fudge += 1
        }
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    private func grow(layoutNodes: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            print("FATAL!!! Grow should ***NOT*** exceed width already... Bad usage!!! (1 Flavor)")
            print("Nodes has \(layoutNodes.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        let widthClasses = LayoutNode.getAllWidthClassesInOrder()
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNodeIndex in 0..<layoutNodes.count {
                    let layoutNode = layoutNodes[layoutNodeIndex]
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidth < space {
                        layoutNode.width += 1
                        consumedWidth += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    @MainActor private func grow(layoutNodes1: [LayoutNode], layoutNodes2: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes1 {
            consumedWidth += layoutNode.width
        }
        for layoutNode in layoutNodes2 {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            print("FATAL!!! Grow should ***NOT*** exceed width already... Bad usage!!! (2 Flavor)")
            print("Nodes 1 has \(layoutNodes1.count), Nodes 2 has \(layoutNodes2.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        var layoutNodes = [LayoutNode]()
        layoutNodes.append(contentsOf: layoutNodes1)
        layoutNodes.append(contentsOf: layoutNodes2)
        
        grow(layoutNodes: layoutNodes, into: space)
    }
    
    // Here the nodes should have "width" calculated (e.g. call "cram" first...)
    @MainActor func place(layoutNodes: [LayoutNode], into space: Int, startingAt x: Int) {
        
        var contentWidth = 0
        for layoutNode in layoutNodes {
            contentWidth += layoutNode.width
        }
        
        var layoutX = 0
        if contentWidth < space {
            layoutX = (space >> 1) - (contentWidth / 2)
        }
        
        for index in 0..<layoutNodes.count {
            layoutNodes[index].x = x + layoutX
            layoutX += layoutNodes[index].width
        }
    }
    
    // Here the nodes should have "width" calculated (e.g. call "cram" first...)
    @MainActor func place(layoutNodes: [LayoutNode], startingAt x: Int) {
        var layoutX = x
        for index in 0..<layoutNodes.count {
            layoutNodes[index].x = layoutX
            layoutX += layoutNodes[index].width
        }
    }
    
    @MainActor private func place(layoutNodes1: [LayoutNode], layoutNodes2: [LayoutNode], into space: Int, startingAt x: Int) {
        var layoutNodes = [LayoutNode]()
        layoutNodes.append(contentsOf: layoutNodes1)
        layoutNodes.append(contentsOf: layoutNodes2)
        place(layoutNodes: layoutNodes, into: space, startingAt: x)
    }
    
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    @MainActor private func cramAndPlaceNew(layoutNodesLeft: [LayoutNode],
                                            layoutNodeCenter: LayoutNode,
                                            layoutNodesRight: [LayoutNode],
                                            totalWidth: Int) {
        
        var consumedWidthLeft = 0
        for index in 0..<layoutNodesLeft.count {
            consumedWidthLeft += layoutNodesLeft[index].width
        }
        
        var consumedWidthRight = 0
        for index in 0..<layoutNodesRight.count {
            consumedWidthRight += layoutNodesRight[index].width
        }
        
        var consumedWidthCenter = layoutNodeCenter.width
        var centerNodeLeft = (totalWidth >> 1) - (consumedWidthCenter >> 1)
        var centerNodeRight = centerNodeLeft + consumedWidthCenter
        
        if consumedWidthLeft >= centerNodeLeft {
            cram(layoutNodes: layoutNodesLeft, into: consumedWidthLeft)
            consumedWidthLeft = 0
            for index in 0..<layoutNodesLeft.count {
                consumedWidthLeft += layoutNodesLeft[index].width
            }
            place(layoutNodes: layoutNodesLeft, startingAt: 0)
            
            layoutNodeCenter.x = consumedWidthLeft
            
            let rightPackingWidth = totalWidth - (consumedWidthLeft + consumedWidthCenter)
            cram(layoutNodes: layoutNodesRight, into: rightPackingWidth)
            
            consumedWidthRight = 0
            for index in 0..<layoutNodesRight.count {
                consumedWidthRight += layoutNodesRight[index].width
            }
            
            place(layoutNodes: layoutNodesRight, startingAt: totalWidth - consumedWidthRight)
        } else if (totalWidth - consumedWidthRight) <= centerNodeRight {
            cram(layoutNodes: layoutNodesRight, into: consumedWidthRight)
            consumedWidthRight = 0
            for index in 0..<layoutNodesRight.count {
                consumedWidthRight += layoutNodesRight[index].width
            }
            place(layoutNodes: layoutNodesRight, startingAt: totalWidth - consumedWidthRight)
            layoutNodeCenter.x = totalWidth - (consumedWidthRight + consumedWidthCenter)
            
            let leftPackingWidth = layoutNodeCenter.x
            cram(layoutNodes: layoutNodesLeft, into: leftPackingWidth)
            place(layoutNodes: layoutNodesLeft, startingAt: 0)
        } else {
            
            func willLeftOverflow() -> Bool {
                if (consumedWidthLeft + 1) >= centerNodeLeft {
                    return true
                } else {
                    return false
                }
            }
            
            func willRightOverflow() -> Bool {
                if (totalWidth - consumedWidthRight - 1) <= centerNodeRight {
                    return true
                } else {
                    return false
                }
            }
            
            let widthClasses = LayoutNode.getAllWidthClassesInOrder()
            var isDone = false
            for widthClass in widthClasses {
                
                if isDone {
                    break
                }
                
                var isDoingCenterNodeLeft = false
                var isContinuingToCheck = true
                while isContinuingToCheck {
                    isContinuingToCheck = false
                    
                    // Grow the center node
                    if isDoingCenterNodeLeft {
                        if willLeftOverflow() {
                            isDone = true
                            break
                        }
                        
                        if layoutNodeCenter.getWidth(class: widthClass) > layoutNodeCenter.width {
                            isContinuingToCheck = true
                            centerNodeLeft -= 1
                            consumedWidthCenter += 1
                            layoutNodeCenter.width += 1
                            isDoingCenterNodeLeft = false
                        }
                    } else {
                        if willRightOverflow() {
                            isDone = true
                            break
                        }
                        
                        if layoutNodeCenter.getWidth(class: widthClass) > layoutNodeCenter.width {
                            isContinuingToCheck = true
                            centerNodeRight += 1
                            consumedWidthCenter += 1
                            layoutNodeCenter.width += 1
                            isDoingCenterNodeLeft = true
                        }
                    }
                    
                    // Grow the left nodes
                    for layoutNode in layoutNodesLeft {
                        if willLeftOverflow() {
                            isDone = true
                            break
                        }
                        if layoutNode.getWidth(class: widthClass) > layoutNode.width {
                            isContinuingToCheck = true
                            consumedWidthLeft += 1
                            layoutNode.width += 1
                        }
                    }
                    
                    // Grow the right nodes
                    for layoutNode in layoutNodesRight {
                        if willRightOverflow() {
                            isDone = true
                            break
                        }
                        if layoutNode.getWidth(class: widthClass) > layoutNode.width {
                            isContinuingToCheck = true
                            consumedWidthRight += 1
                            layoutNode.width += 1
                        }
                    }
                }
            }
            
            
            isDone = false
            for widthClass in widthClasses {
                
                if isDone {
                    break
                }
                
                var isContinuingToCheck = true
                while isContinuingToCheck {
                    isContinuingToCheck = false
                    
                    // Grow the left nodes
                    for layoutNode in layoutNodesLeft {
                        if willLeftOverflow() {
                            isDone = true
                            break
                        }
                        if layoutNode.getWidth(class: widthClass) > layoutNode.width {
                            isContinuingToCheck = true
                            consumedWidthLeft += 1
                            layoutNode.width += 1
                        }
                    }
                }
            }
            
            isDone = false
            for widthClass in widthClasses {
                
                if isDone {
                    break
                }
                
                var isContinuingToCheck = true
                while isContinuingToCheck {
                    isContinuingToCheck = false
                    
                    // Grow the right nodes
                    for layoutNode in layoutNodesRight {
                        if willRightOverflow() {
                            isDone = true
                            break
                        }
                        if layoutNode.getWidth(class: widthClass) > layoutNode.width {
                            isContinuingToCheck = true
                            consumedWidthRight += 1
                            layoutNode.width += 1
                        }
                    }
                }
            }
            
            cram(layoutNodes: layoutNodesLeft, into: consumedWidthLeft)
            place(layoutNodes: layoutNodesLeft, startingAt: 0)
            
            layoutNodeCenter.x = centerNodeLeft
            
            consumedWidthRight = 0
            for index in 0..<layoutNodesRight.count {
                consumedWidthRight += layoutNodesRight[index].width
            }
            place(layoutNodes: layoutNodesRight, startingAt: totalWidth - consumedWidthRight)
        }
        
        
        /*
         var consumedWidth = 0
         for layoutNode in layoutNodesLeft {
         consumedWidth += layoutNode.width
         }
         consumedWidth += layoutNodeCenter.width
         for layoutNode in layoutNodesRight {
         consumedWidth += layoutNode.width
         }
         if consumedWidth > totalWidth {
         print("FATAL!!! Cram+Place should ***NOT*** exceed width already... Bad usage!!!")
         print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
         var layoutNodes = [LayoutNode]()
         for layoutNode in layoutNodesLeft {
         layoutNodes.append(layoutNode)
         }
         layoutNodes.append(layoutNodeCenter)
         for layoutNode in layoutNodesRight {
         layoutNodes.append(layoutNode)
         }
         place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
         return
         }
         
         var consumedWidthLeft = 0
         for layoutNode in layoutNodesLeft {
         consumedWidthLeft += layoutNode.width
         }
         var consumedWidthRight = 0
         for layoutNode in layoutNodesRight {
         consumedWidthRight += layoutNode.width
         }
         
         var centerItemLeft = (totalWidth >> 1) - (layoutNodeCenter.width >> 1)
         var availableSpaceLeftSide = centerItemLeft
         var availableSpaceRightSide = (totalWidth - (centerItemLeft + layoutNodeCenter.width))
         
         if availableSpaceLeftSide < consumedWidthLeft {
         print("FATAL!!! Cram+Place should ***NOT*** overflow on left... Bad usage!!!")
         print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
         print("availableSpaceLeftSide is \(availableSpaceLeftSide), consumedWidthLeft is \(consumedWidthLeft)")
         var layoutNodes = [LayoutNode]()
         for layoutNode in layoutNodesLeft {
         layoutNodes.append(layoutNode)
         }
         layoutNodes.append(layoutNodeCenter)
         for layoutNode in layoutNodesRight {
         layoutNodes.append(layoutNode)
         }
         place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
         return
         }
         
         if availableSpaceRightSide < consumedWidthRight {
         print("FATAL!!! Cram+Place should ***NOT*** overflow on right... Bad usage!!!")
         print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
         print("availableSpaceLeftSide is \(availableSpaceRightSide), consumedWidthRight is \(consumedWidthRight)")
         var layoutNodes = [LayoutNode]()
         for layoutNode in layoutNodesLeft {
         layoutNodes.append(layoutNode)
         }
         layoutNodes.append(layoutNodeCenter)
         for layoutNode in layoutNodesRight {
         layoutNodes.append(layoutNode)
         }
         place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
         return
         }
         
         let widthClasses = LayoutNode.getAllWidthClassesInOrder()
         
         
         // The first thing we want to do is evenly distribute points to...
         //
         //  a.) everything on the left
         //  b.) everything on the right
         //  c.) the center (tricky one)
         //
         // ...But we need to make sure we don't end up in illegal state...
         
         for widthClass in widthClasses {
         var fudge = 0
         var reloop = true
         var isLeftSide = false
         while fudge < 2048 && reloop == true {
         reloop = false
         
         if isLeftSide {
         
         // Can we expand into the left zone?
         if consumedWidthLeft < availableSpaceLeftSide {
         if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
         availableSpaceLeftSide -= 1
         centerItemLeft -= 1
         layoutNodeCenter.width += 1
         }
         } else {
         // Stop
         break
         }
         isLeftSide = false
         } else {
         
         // Can we expand into the right zone?
         if consumedWidthRight < availableSpaceRightSide {
         if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
         availableSpaceRightSide -= 1
         layoutNodeCenter.width += 1
         }
         } else {
         // Stop
         break
         }
         isLeftSide = true
         }
         
         if consumedWidthLeft < availableSpaceLeftSide {
         for layoutNode in layoutNodesLeft {
         if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
         layoutNode.width += 1
         consumedWidthLeft += 1
         reloop = true
         }
         }
         }
         
         if consumedWidthRight < availableSpaceRightSide {
         for layoutNode in layoutNodesRight {
         if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
         layoutNode.width += 1
         consumedWidthRight += 1
         reloop = true
         }
         }
         }
         
         fudge += 1
         }
         }
         
         // Grow up the left...
         for widthClass in widthClasses {
         var fudge = 0
         var reloop = true
         while fudge < 2048 && reloop == true {
         reloop = false
         for layoutNode in layoutNodesLeft {
         if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
         layoutNode.width += 1
         consumedWidthLeft += 1
         reloop = true
         }
         }
         fudge += 1
         }
         }
         
         // Grow up the right...
         for widthClass in widthClasses {
         var fudge = 0
         var reloop = true
         while fudge < 2048 && reloop == true {
         reloop = false
         for layoutNode in layoutNodesRight {
         if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
         layoutNode.width += 1
         consumedWidthRight += 1
         reloop = true
         }
         }
         fudge += 1
         }
         }
         
         // Place the center one...
         layoutNodeCenter.x = centerItemLeft
         
         // Place the left nodes
         place(layoutNodes: layoutNodesLeft, into: availableSpaceLeftSide, startingAt: 0)
         
         // Place the right nodes
         place(layoutNodes: layoutNodesRight, into: availableSpaceRightSide, startingAt: availableSpaceLeftSide + layoutNodeCenter.width)
         */
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    @MainActor private func cramAndPlace(layoutNodesLeft: [LayoutNode],
                                         layoutNodeCenter: LayoutNode,
                                         layoutNodesRight: [LayoutNode],
                                         totalWidth: Int) {
        
        var consumedWidth = 0
        for layoutNode in layoutNodesLeft {
            consumedWidth += layoutNode.width
        }
        consumedWidth += layoutNodeCenter.width
        for layoutNode in layoutNodesRight {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > totalWidth {
            print("FATAL!!! Cram+Place should ***NOT*** exceed width already... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        var consumedWidthLeft = 0
        for layoutNode in layoutNodesLeft {
            consumedWidthLeft += layoutNode.width
        }
        var consumedWidthRight = 0
        for layoutNode in layoutNodesRight {
            consumedWidthRight += layoutNode.width
        }
        
        var centerItemLeft = (totalWidth >> 1) - (layoutNodeCenter.width >> 1)
        var availableSpaceLeftSide = centerItemLeft
        var availableSpaceRightSide = (totalWidth - (centerItemLeft + layoutNodeCenter.width))
        
        if availableSpaceLeftSide < consumedWidthLeft {
            print("FATAL!!! Cram+Place should ***NOT*** overflow on left... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            print("availableSpaceLeftSide is \(availableSpaceLeftSide), consumedWidthLeft is \(consumedWidthLeft)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        if availableSpaceRightSide < consumedWidthRight {
            print("FATAL!!! Cram+Place should ***NOT*** overflow on right... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            print("availableSpaceLeftSide is \(availableSpaceRightSide), consumedWidthRight is \(consumedWidthRight)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        let widthClasses = LayoutNode.getAllWidthClassesInOrder()
        
        
        // The first thing we want to do is evenly distribute points to...
        //
        //  a.) everything on the left
        //  b.) everything on the right
        //  c.) the center (tricky one)
        //
        // ...But we need to make sure we don't end up in illegal state...
        
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            var isLeftSide = false
            while fudge < 2048 && reloop == true {
                reloop = false
                
                if isLeftSide {
                    
                    // Can we expand into the left zone?
                    if consumedWidthLeft < availableSpaceLeftSide {
                        if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
                            availableSpaceLeftSide -= 1
                            centerItemLeft -= 1
                            layoutNodeCenter.width += 1
                        }
                    } else {
                        // Stop
                        break
                    }
                    isLeftSide = false
                } else {
                    
                    // Can we expand into the right zone?
                    if consumedWidthRight < availableSpaceRightSide {
                        if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
                            availableSpaceRightSide -= 1
                            layoutNodeCenter.width += 1
                        }
                    } else {
                        // Stop
                        break
                    }
                    isLeftSide = true
                }
                
                if consumedWidthLeft < availableSpaceLeftSide {
                    for layoutNode in layoutNodesLeft {
                        if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
                            layoutNode.width += 1
                            consumedWidthLeft += 1
                            reloop = true
                        }
                    }
                }
                
                if consumedWidthRight < availableSpaceRightSide {
                    for layoutNode in layoutNodesRight {
                        if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
                            layoutNode.width += 1
                            consumedWidthRight += 1
                            reloop = true
                        }
                    }
                }
                
                fudge += 1
            }
        }
        
        // Grow up the left...
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNode in layoutNodesLeft {
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
                        layoutNode.width += 1
                        consumedWidthLeft += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
        
        // Grow up the right...
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNode in layoutNodesRight {
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
                        layoutNode.width += 1
                        consumedWidthRight += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
        
        // Place the center one...
        layoutNodeCenter.x = centerItemLeft
        
        // Place the left nodes
        place(layoutNodes: layoutNodesLeft, into: availableSpaceLeftSide, startingAt: 0)
        
        // Place the right nodes
        place(layoutNodes: layoutNodesRight, into: availableSpaceRightSide, startingAt: availableSpaceLeftSide + layoutNodeCenter.width)
    }
    
    
    @MainActor func layout(orientation: Orientation,
                           menuWidthWithSafeArea: Int,
                           height: Int,
                           safeAreaLeft: Int,
                           safeAreaRight: Int) {
        
        
        let width = (menuWidthWithSafeArea - safeAreaLeft - safeAreaRight)
        
        let layoutStackingCategory = ToolInterfaceViewModel.calculateLayoutStackingCategory(orientation: orientation,
                                                                                            width: width,
                                                                                            height: height,
                                                                                            nodes: nodes,
                                                                                            centerPinnedElement: centerPinnedElement,
                                                                                            slot: slot)
        for node in nodes {
            node.magicalViewModel.layoutStackingCategory = layoutStackingCategory
        }
        
        let isSmall = layoutStackingCategory.isSmall
        let isMedium = layoutStackingCategory.isMedium
        
        let isButtonLong = layoutStackingCategory.isButtonLong
        let isModeSwitchLong = layoutStackingCategory.isModeSwitchLong
        let isCheckBoxLong = layoutStackingCategory.isCheckBoxLong
        let isSegmentLong = layoutStackingCategory.isSegmentLong
        
        var layoutNodes = [LayoutNode]()
        let rowContentWidth = (menuWidthWithSafeArea - (safeAreaLeft + safeAreaRight))
        for node in nodes {
            let layoutNode = LayoutNode()
            switch node.flex {
                
            case .createSwatch(let flexLongData):
                
                if isSmall {
                    layoutNode.width = flexLongData.squeezedWidthSmall
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthSmall
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthSmall
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthSmall
                    
                } else if isMedium {
                    layoutNode.width = flexLongData.squeezedWidthMedium
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthMedium
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthMedium
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthMedium
                    
                } else {
                    layoutNode.width = flexLongData.squeezedWidthLarge
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthLarge
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthLarge
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthLarge
                }
            case .mainTab(let flexLongData):
                
                if isSmall {
                    layoutNode.width = flexLongData.squeezedWidthSmall
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthSmall
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthSmall
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthSmall
                    
                } else if isMedium {
                    layoutNode.width = flexLongData.squeezedWidthMedium
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthMedium
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthMedium
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthMedium
                    
                } else {
                    layoutNode.width = flexLongData.squeezedWidthLarge
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthLarge
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthLarge
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthLarge
                }
                
            case .segment(let flexConvertibleData):
                if isSegmentLong {
                    layoutNode.width = flexConvertibleData.squeezedWidthLong
                    layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthLong
                    layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthLong
                    layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthLong
                    
                } else {
                    if isSmall {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedSmall
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedSmall
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedSmall
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedSmall
                        
                    } else if isMedium {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedMedium
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedMedium
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedMedium
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedMedium
                        
                    } else {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedLarge
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedLarge
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedLarge
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedLarge
                    }
                }
            case .favoringOneLineLabel(let flexFavoringOneLineLabelData):
                layoutNode.width = flexFavoringOneLineLabelData.squeezedTwoLineWidth
                layoutNode.layoutWidthHigh = flexFavoringOneLineLabelData.squeezedOneLineWidth
                layoutNode.layoutWidthMedium = flexFavoringOneLineLabelData.standardOneLineWidth
                layoutNode.layoutWidthLow = flexFavoringOneLineLabelData.relaxedOneLineWidth
                
            case .greenButton(let flexLongData):
                
                if isSmall {
                    layoutNode.width = flexLongData.squeezedWidthSmall
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthSmall
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthSmall
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthSmall
                    
                } else if isMedium {
                    layoutNode.width = flexLongData.squeezedWidthMedium
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthMedium
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthMedium
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthMedium
                    
                } else {
                    layoutNode.width = flexLongData.squeezedWidthLarge
                    layoutNode.layoutWidthHigh = flexLongData.standardWidthLarge
                    layoutNode.layoutWidthMedium = flexLongData.relaxedWidthLarge
                    layoutNode.layoutWidthLow = flexLongData.relaxedWidthLarge
                }
                
            case .enterMode(let flexConvertibleData):
                if isModeSwitchLong {
                    layoutNode.width = flexConvertibleData.squeezedWidthLong
                    layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthLong
                    layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthLong
                    layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthLong
                    
                } else {
                    if isSmall {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedSmall
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedSmall
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedSmall
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedSmall
                        
                    } else if isMedium {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedMedium
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedMedium
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedMedium
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedMedium
                        
                    } else {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedLarge
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedLarge
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedLarge
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedLarge
                    }
                }
            case .exitMode(let flexConvertibleData):
                if isModeSwitchLong {
                    layoutNode.width = flexConvertibleData.squeezedWidthLong
                    layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthLong
                    layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthLong
                    layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedSmall
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedSmall
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedSmall
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedMedium
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedMedium
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedMedium
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedMedium
                    } else {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedLarge
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedLarge
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedLarge
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedLarge
                    }
                }
            case .sexyCheckBox(let flexConvertibleData):
                if isCheckBoxLong {
                    layoutNode.width = flexConvertibleData.squeezedWidthLong
                    layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthLong
                    layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthLong
                    layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthLong
                    
                } else {
                    if isSmall {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedSmall
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedSmall
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedSmall
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedSmall
                        
                    } else if isMedium {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedMedium
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedMedium
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedMedium
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedMedium
                        
                    } else {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedLarge
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedLarge
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedLarge
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedLarge
                    }
                }
            case .sexyButton(let flexConvertibleData):
                if isButtonLong {
                    layoutNode.width = flexConvertibleData.squeezedWidthLong
                    layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthLong
                    layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthLong
                    layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedSmall
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedSmall
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedSmall
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedMedium
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedMedium
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedMedium
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedMedium
                    } else {
                        layoutNode.width = flexConvertibleData.squeezedWidthStackedLarge
                        layoutNode.layoutWidthHigh = flexConvertibleData.standardWidthStackedLarge
                        layoutNode.layoutWidthMedium = flexConvertibleData.relaxedWidthStackedLarge
                        layoutNode.layoutWidthLow = flexConvertibleData.relaxedWidthStackedLarge
                    }
                }
            case .sexyStepper(let flexSexyStepperData):
                if isSmall {
                    layoutNode.width = flexSexyStepperData.minimumWidthSmall
                    layoutNode.layoutWidthHigh = flexSexyStepperData.standardWidthSmall
                    layoutNode.layoutWidthMedium = flexSexyStepperData.standardWidthSmall
                    layoutNode.layoutWidthLow = flexSexyStepperData.relaxedWidthSmall
                } else if isMedium {
                    layoutNode.width = flexSexyStepperData.minimumWidthMedium
                    layoutNode.layoutWidthHigh = flexSexyStepperData.standardWidthMedium
                    layoutNode.layoutWidthMedium = flexSexyStepperData.standardWidthMedium
                    layoutNode.layoutWidthLow = flexSexyStepperData.relaxedWidthMedium
                } else {
                    layoutNode.width = flexSexyStepperData.minimumWidthLarge
                    layoutNode.layoutWidthHigh = flexSexyStepperData.standardWidthLarge
                    layoutNode.layoutWidthMedium = flexSexyStepperData.standardWidthLarge
                    layoutNode.layoutWidthLow = flexSexyStepperData.relaxedWidthLarge
                }
            case .slider(let flexSliderData):
                let width: Int
                switch flexSliderData.widthCategory {
                case .fullWidth:
                    width = rowContentWidth
                    layoutNode.width = width
                    layoutNode.layoutWidthHigh = width
                    layoutNode.layoutWidthMedium = width
                    layoutNode.layoutWidthLow = width
                    layoutNode.minimumWidth = width
                case .stretch:
                    if isSmall {
                        layoutNode.width = flexSliderData.minimumWidthSmall
                        layoutNode.layoutWidthHigh = flexSliderData.standardWidthSmall
                        layoutNode.layoutWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.layoutWidthLow = 100_000_000
                    } else if isMedium {
                        layoutNode.width = flexSliderData.minimumWidthMedium
                        layoutNode.layoutWidthHigh = flexSliderData.standardWidthMedium
                        layoutNode.layoutWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.layoutWidthLow = 100_000_000
                    } else {
                        layoutNode.width = flexSliderData.minimumWidthLarge
                        layoutNode.layoutWidthHigh = flexSliderData.standardWidthLarge
                        layoutNode.layoutWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.layoutWidthLow = 100_000_000
                    }
                case .halfWidthLeft:
                    width = rowContentWidth / 2
                    layoutNode.width = width
                    layoutNode.layoutWidthHigh = width
                    layoutNode.layoutWidthMedium = width
                    layoutNode.layoutWidthLow = width
                    layoutNode.minimumWidth = width
                case .halfWidthRight:
                    width = rowContentWidth - (rowContentWidth / 2)
                    layoutNode.width = width
                    layoutNode.layoutWidthHigh = width
                    layoutNode.layoutWidthMedium = width
                    layoutNode.layoutWidthLow = width
                    layoutNode.minimumWidth = width
                }
            case .dividerSpacerDivider(let flexDividerSpacerDividerData):
                layoutNode.width = flexDividerSpacerDividerData.minimumWidth
                layoutNode.layoutWidthHigh = flexDividerSpacerDividerData.minimumWidth
                layoutNode.layoutWidthMedium = flexDividerSpacerDividerData.standardWidth
                layoutNode.layoutWidthLow = 100_000_000
            case .iconButton(let flexIconButtonData):
                layoutNode.width = flexIconButtonData.minimumWidth
                layoutNode.layoutWidthHigh = flexIconButtonData.standardWidth
                layoutNode.layoutWidthMedium = flexIconButtonData.standardWidth
                layoutNode.layoutWidthLow = flexIconButtonData.relaxedWidth
            case .fixed(let fixedWidth):
                layoutNode.width = fixedWidth
                layoutNode.layoutWidthHigh = fixedWidth
                layoutNode.layoutWidthMedium = fixedWidth
                layoutNode.layoutWidthLow = fixedWidth
            case .spacer(let flexSpacerData):
                layoutNode.width = flexSpacerData.defaultWidth
                layoutNode.layoutWidthHigh = flexSpacerData.defaultWidth
                layoutNode.layoutWidthMedium = flexSpacerData.defaultWidth
                layoutNode.layoutWidthLow = 100_000_000
                layoutNode.isShrinkable = true
                layoutNode.isSpacer = true
            }
            layoutNodes.append(layoutNode)
        }
        
        // Let's figure out if we need to center one of the elements...
        
        var layoutNodesLeft = [LayoutNode]()
        var layoutNodeCenterPinnedElement: LayoutNode?
        var layoutNodesRight = [LayoutNode]()
        if let centerPinnedElement = centerPinnedElement {
            var centerIndex = -1
            for index in 0..<nodes.count {
                let node = nodes[index]
                if node.element == centerPinnedElement {
                    centerIndex = index
                    //toolNodeCenterPinnedElement = nodes[index]
                    layoutNodeCenterPinnedElement = layoutNodes[index]
                    break
                }
            }
            if centerIndex != -1 {
                var index = 0
                while index < centerIndex {
                    layoutNodesLeft.append(layoutNodes[index])
                    //toolNodesLeft.append(nodes[index])
                    index += 1
                }
                index = centerIndex + 1
                while index < nodes.count {
                    layoutNodesRight.append(layoutNodes[index])
                    //toolNodesRight.append(nodes[index])
                    index += 1
                }
            }
        }
        
        if let layoutNodeCenterPinnedElement = layoutNodeCenterPinnedElement {
            
            // 1.) Let's put this layout into 1 of 4 categories.
            //   a.) It will work fine with the center element exactly centered.
            //   b.) It will work fine, but the content on the left will need to nudge the center content.
            //   c.) It will work fine, but the content on the right will need to nudge the center content.
            //   d.) The layout will not work;
            
            var consumedWidthLeft = 0
            for index in 0..<layoutNodesLeft.count {
                consumedWidthLeft += layoutNodesLeft[index].width
            }
            
            var consumedWidthRight = 0
            for index in 0..<layoutNodesRight.count {
                consumedWidthRight += layoutNodesRight[index].width
            }
            
            if (consumedWidthLeft + layoutNodeCenterPinnedElement.width + consumedWidthRight) > rowContentWidth {
                cram(layoutNodes: layoutNodes, into: rowContentWidth)
                place(layoutNodes: layoutNodes, into: rowContentWidth, startingAt: 0)
            } else {
                cramAndPlaceNew(layoutNodesLeft: layoutNodesLeft,
                                layoutNodeCenter: layoutNodeCenterPinnedElement,
                                layoutNodesRight: layoutNodesRight,
                                totalWidth: rowContentWidth)
            }
        } else {
            cram(layoutNodes: layoutNodes, into: rowContentWidth)
            place(layoutNodes: layoutNodes, into: rowContentWidth, startingAt: 0)
        }
        
        for index in 0..<nodes.count {
            let layoutNode = layoutNodes[index]
            let node = nodes[index]
            node.layoutX = layoutNode.x
            node.layoutY = 0
            node.layoutWidth = layoutNode.width
            node.layoutHeight = height
        }
        
        for index in 0..<nodes.count {
            let node = nodes[index]
            node.magicalViewModel.refreshLayoutFrame()
        }
        
        _widthConstraint?.constant = CGFloat(rowContentWidth)
        _leftConstraint?.constant = CGFloat(safeAreaLeft)
    }
}
