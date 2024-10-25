//
//  RowBluePrint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/25/24.
//

import Foundation

/*
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
*/
