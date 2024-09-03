//
//  RowBluePrint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/25/24.
//

import Foundation

struct RowBluePrint {
    
    var configuration: ToolRowConfiguration
    var nodes: [ToolNode]
    var centerPinnedElement: ToolInterfaceElement?
    
    init(nodes: [ToolNode], configuration: ToolRowConfiguration, centerPinnedElement: ToolInterfaceElement? = nil) {
        self.nodes = nodes
        self.configuration = configuration
        self.centerPinnedElement = centerPinnedElement
        
        
        SANITY_CHECK(configuration: configuration)
    }
    
    init(nodes: [ToolNode], configuration: ToolRowConfiguration, centerPinnedNode: ToolNode? = nil) {
        self.nodes = nodes
        self.configuration = configuration
        self.centerPinnedElement = centerPinnedNode?.element
        
        SANITY_CHECK(configuration: configuration)
    }
    
    func SANITY_CHECK(configuration: ToolRowConfiguration) {
        
        /*
        var nodeIndex = 0
        while nodeIndex < nodes.count {
            
            if nodeIndex == 0 {
                if nodes.count == 1 {
                    if nodes[nodeIndex].neighborTypeLeft != nil {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeLeft as NIL, got \(nodes[nodeIndex].neighborTypeLeft!) [\(nodes.count) node case]")
                    }
                    if nodes[nodeIndex].neighborTypeRight != nil {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as NIL, got \(nodes[nodeIndex].neighborTypeRight!) [\(nodes.count) node case]")
                    }
                } else {
                    let nextNode = nodes[nodeIndex + 1]
                    if nodes[nodeIndex].neighborTypeLeft != nil {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeLeft as NIL, got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                    }
                    if nodes[nodeIndex].neighborTypeRight != nextNode.type {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as \(nextNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeRight)) [\(nodes.count) node case]")
                    }
                }
                
            } else if nodeIndex == (nodes.count - 1) {
                let previousNode = nodes[nodeIndex - 1]
                if nodes[nodeIndex].neighborTypeLeft != previousNode.type {
                    print("@Nodes @[\(configuration)] @ \(nodeIndex), expected previousNode as \(previousNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                }
                if nodes[nodeIndex].neighborTypeRight != nil {
                    print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as NIL, got \(nodes[nodeIndex].neighborTypeRight!) [\(nodes.count) node case]")
                }
                
            } else {
                let previousNode = nodes[nodeIndex - 1]
                let nextNode = nodes[nodeIndex + 1]
                if nodes[nodeIndex].neighborTypeLeft != previousNode.type {
                    print("@Nodes @[\(configuration)] @ \(nodeIndex), expected previousNode as \(previousNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                }
                if nodes[nodeIndex].neighborTypeRight != nextNode.type {
                    print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as \(nextNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeRight)) [\(nodes.count) node case]")
                }
            }
            
            nodeIndex += 1
        }
        */
    }
    
    init(nodes: [ToolNode], configuration: ToolRowConfiguration) {
        self.nodes = nodes
        self.configuration = configuration
        self.centerPinnedElement = nil
    }
    
    func getCenterPinnedNode() -> ToolNode? {
        for node in nodes {
            if node.element == centerPinnedElement {
                return node
            }
        }
        return nil
    }
}
