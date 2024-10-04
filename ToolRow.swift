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
        var maximumWidthHigh = 0
        var maximumWidthMedium = 0
        var maximumWidthLow = 0
        var minimumWidth = 0
        var isShrinkable = false
        var isSpacer = false
        func getWidth(`class`: WidthClass) -> Int {
            switch `class` {
            case .high:
                return maximumWidthHigh
            case .medium:
                return maximumWidthMedium
            case .low:
                return maximumWidthLow
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
        
        let isSegmentLong = layoutStackingCategory.isSegmentLong
        let isCheckBoxLong = layoutStackingCategory.isCheckBoxLong
        let isTextIconButtonLong = layoutStackingCategory.isTextIconButtonLong
        
        var layoutNodes = [LayoutNode]()
        let rowContentWidth = (menuWidthWithSafeArea - (safeAreaLeft + safeAreaRight))
        for node in nodes {
            let layoutNode = LayoutNode()
            switch node.flex {
            case .sexyStepper(let flexSexyStepperData):
                if isSmall {
                    layoutNode.width = flexSexyStepperData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexSexyStepperData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexSexyStepperData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexSexyStepperData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexSexyStepperData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexSexyStepperData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexSexyStepperData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexSexyStepperData.maximumWidthMedium
                } else {
                    layoutNode.width = flexSexyStepperData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexSexyStepperData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexSexyStepperData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexSexyStepperData.maximumWidthLarge
                }
            case .enterMode(let flexEnterModeData):
                if isSmall {
                    layoutNode.width = flexEnterModeData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexEnterModeData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexEnterModeData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexEnterModeData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexEnterModeData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexEnterModeData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexEnterModeData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexEnterModeData.maximumWidthMedium
                } else {
                    layoutNode.width = flexEnterModeData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexEnterModeData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexEnterModeData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexEnterModeData.maximumWidthLarge
                }
            case .exitMode(let flexExitModeData):
                if isSmall {
                    layoutNode.width = flexExitModeData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexExitModeData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexExitModeData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexExitModeData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexExitModeData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexExitModeData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexExitModeData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexExitModeData.maximumWidthMedium
                } else {
                    layoutNode.width = flexExitModeData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexExitModeData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexExitModeData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexExitModeData.maximumWidthLarge
                }
            case .sexyCheckBox(let flexSexyCheckBoxData):
                if isSmall {
                    layoutNode.width = flexSexyCheckBoxData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexSexyCheckBoxData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexSexyCheckBoxData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexSexyCheckBoxData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexSexyCheckBoxData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexSexyCheckBoxData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexSexyCheckBoxData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexSexyCheckBoxData.maximumWidthMedium
                } else {
                    layoutNode.width = flexSexyCheckBoxData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexSexyCheckBoxData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexSexyCheckBoxData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexSexyCheckBoxData.maximumWidthLarge
                }
            case .favoringOneLineLabel(let flexFavoringOneLineLabelData):
                layoutNode.width = flexFavoringOneLineLabelData.minimumWidth
                layoutNode.maximumWidthHigh = flexFavoringOneLineLabelData.twoLineWidth
                layoutNode.maximumWidthMedium = flexFavoringOneLineLabelData.oneLineWidthPadded
                layoutNode.maximumWidthLow = flexFavoringOneLineLabelData.oneLineWidthPadded
            case .slider(let flexSliderData):
                let width: Int
                switch flexSliderData.widthCategory {
                case .fullWidth:
                    width = rowContentWidth
                    layoutNode.width = width
                    layoutNode.maximumWidthHigh = width
                    layoutNode.maximumWidthMedium = width
                    layoutNode.maximumWidthLow = width
                    layoutNode.minimumWidth = width
                case .stretch:
                    if isSmall {
                        layoutNode.width = flexSliderData.minimumWidthSmall
                        layoutNode.maximumWidthHigh = flexSliderData.standardWidthSmall
                        layoutNode.maximumWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.maximumWidthLow = 100_000_000
                    } else if isMedium {
                        layoutNode.width = flexSliderData.minimumWidthMedium
                        layoutNode.maximumWidthHigh = flexSliderData.standardWidthMedium
                        layoutNode.maximumWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.maximumWidthLow = 100_000_000
                    } else {
                        layoutNode.width = flexSliderData.minimumWidthLarge
                        layoutNode.maximumWidthHigh = flexSliderData.standardWidthLarge
                        layoutNode.maximumWidthMedium = max(flexSliderData.standardWidthSmall, rowContentWidth / 2)
                        layoutNode.maximumWidthLow = 100_000_000
                    }
                case .halfWidthLeft:
                    width = rowContentWidth / 2
                    layoutNode.width = width
                    layoutNode.maximumWidthHigh = width
                    layoutNode.maximumWidthMedium = width
                    layoutNode.maximumWidthLow = width
                    layoutNode.minimumWidth = width
                case .halfWidthRight:
                    width = rowContentWidth - (rowContentWidth / 2)
                    layoutNode.width = width
                    layoutNode.maximumWidthHigh = width
                    layoutNode.maximumWidthMedium = width
                    layoutNode.maximumWidthLow = width
                    layoutNode.minimumWidth = width
                }
            case .dividerSpacerDivider(let flexDividerSpacerDividerData):
                layoutNode.width = flexDividerSpacerDividerData.minimumWidth
                layoutNode.maximumWidthHigh = flexDividerSpacerDividerData.minimumWidth
                layoutNode.maximumWidthMedium = flexDividerSpacerDividerData.standardWidth
                layoutNode.maximumWidthLow = 100_000_000
            case .iconButton(let flexIconButtonData):
                layoutNode.width = flexIconButtonData.minimumWidth
                layoutNode.maximumWidthHigh = flexIconButtonData.standardWidth
                layoutNode.maximumWidthMedium = flexIconButtonData.standardWidth
                layoutNode.maximumWidthLow = flexIconButtonData.maximumWidth
            case .textIconButton(let flexTextIconButtonData):
                if isTextIconButtonLong {
                    layoutNode.width = flexTextIconButtonData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthLong
                    layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthLong
                    layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedSmall
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedSmall
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedMedium
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedMedium
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedLarge
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedLarge
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedLarge
                    }
                }
                layoutNode.isShrinkable = false
            case .sexyButton(let flexSexyButtonData):
                if isSmall {
                    layoutNode.width = flexSexyButtonData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexSexyButtonData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexSexyButtonData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexSexyButtonData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexSexyButtonData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexSexyButtonData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexSexyButtonData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexSexyButtonData.maximumWidthMedium
                } else {
                    layoutNode.width = flexSexyButtonData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexSexyButtonData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexSexyButtonData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexSexyButtonData.maximumWidthLarge
                }
                
            case .greenButton(let flexGreenButtonData):
                layoutNode.width = flexGreenButtonData.minimumWidth
                layoutNode.maximumWidthHigh = flexGreenButtonData.standardWidth
                layoutNode.maximumWidthMedium = flexGreenButtonData.standardWidth
                layoutNode.maximumWidthLow = flexGreenButtonData.maximumWidth
            case .checkBox(let flexCheckBoxData):
                if isCheckBoxLong {
                    layoutNode.width = flexCheckBoxData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthLong
                    layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthLong
                    layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedSmall
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedSmall
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedMedium
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedMedium
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedLarge
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedLarge
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedLarge
                    }
                }
            case .segment(let flexSegmentData):
                if isSegmentLong {
                    layoutNode.width = flexSegmentData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexSegmentData.standardWidthLong
                    layoutNode.maximumWidthMedium = flexSegmentData.standardWidthLong
                    layoutNode.maximumWidthLow = flexSegmentData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexSegmentData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexSegmentData.standardWidthStackedSmall
                        layoutNode.maximumWidthMedium = flexSegmentData.standardWidthStackedSmall
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexSegmentData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexSegmentData.standardWidthStackedMedium
                        layoutNode.maximumWidthMedium = flexSegmentData.standardWidthStackedMedium
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexSegmentData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexSegmentData.standardWidthStackedLarge
                        layoutNode.maximumWidthMedium = flexSegmentData.standardWidthStackedLarge
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedLarge
                    }
                }
            case .mainTab(let flexMainTabData):
                if isSmall {
                    layoutNode.width = flexMainTabData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexMainTabData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexMainTabData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexMainTabData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexMainTabData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexMainTabData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexMainTabData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexMainTabData.maximumWidthMedium
                } else {
                    layoutNode.width = flexMainTabData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexMainTabData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexMainTabData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexMainTabData.maximumWidthLarge
                }
                
            case .createSwatch(let flexCreateSwatchData):
                if isSmall {
                    layoutNode.width = flexCreateSwatchData.minimumWidthSmall
                    layoutNode.maximumWidthHigh = flexCreateSwatchData.standardWidthSmall
                    layoutNode.maximumWidthMedium = flexCreateSwatchData.standardWidthSmall
                    layoutNode.maximumWidthLow = flexCreateSwatchData.maximumWidthSmall
                } else if isMedium {
                    layoutNode.width = flexCreateSwatchData.minimumWidthMedium
                    layoutNode.maximumWidthHigh = flexCreateSwatchData.standardWidthMedium
                    layoutNode.maximumWidthMedium = flexCreateSwatchData.standardWidthMedium
                    layoutNode.maximumWidthLow = flexCreateSwatchData.maximumWidthMedium
                } else {
                    layoutNode.width = flexCreateSwatchData.minimumWidthLarge
                    layoutNode.maximumWidthHigh = flexCreateSwatchData.standardWidthLarge
                    layoutNode.maximumWidthMedium = flexCreateSwatchData.standardWidthLarge
                    layoutNode.maximumWidthLow = flexCreateSwatchData.maximumWidthLarge
                }
            case .fixed(let fixedWidth):
                layoutNode.width = fixedWidth
                layoutNode.maximumWidthHigh = fixedWidth
                layoutNode.maximumWidthMedium = fixedWidth
                layoutNode.maximumWidthLow = fixedWidth
                layoutNode.isShrinkable = false
            case .spacer(let flexSpacerData):
                layoutNode.width = flexSpacerData.defaultWidth
                layoutNode.maximumWidthHigh = flexSpacerData.defaultWidth
                layoutNode.maximumWidthMedium = flexSpacerData.defaultWidth
                layoutNode.maximumWidthLow = 100_000_000
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
                print("Case D: None of this sh** will fit... ")
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
