//
//  ToolAction.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

// Here is the idea with "Tool Action..."

// 1.) Only 1 tool action at a time...
//     A tool action is enqueued, then
//     no other actions are allowed until
//     all steps execute to completion.

// 2.) A "Tool Action" is broken down
//     into several "Tool Action Phase."
//     Each phase happens on a display
//     link refresh

// 3.) Anything that can effect the state
//     of interface must be routed through
//     the tool action system.

// 4.) Some of the actions are a bit more
//     involved, so they will need to trigger
//     off a few things at once, which cannot
//     contradict each other.

// === An Example of a tool action ===
//
//   => The "Undo" button is clicked... The action was "move weight graph node vertical position"
//                                      We've since switched modes to point mode, which disables the graph...
//                                      Last time we were in "weight mode" the "display mode" was the split view...
//
//   => [Phase] Wait (wait for 1 display link pass, which will allow the button to unclick)
//
//   => [Phase] Execute the undo (which will be stored on the tool action)
//              Note that some of these cause a heavy lag thunk, up to 0.4 seconds.
//        [Subphase] update the document mode to "weight" and execute re-generation
//                   of the meshes, borders, etc for weight document mode...
//        [Subphase] update the "is graph option checked" value to TRUE.
//                   (Note, updating "is graph option checked" is separate
//                    from the menu transition itself... This just triggers
//                    the checkbox state to update)
//
//   => [Phase] Wait (wait for 1 display link, the "document mode" segment and
//              "graph enabled" check box will update to the correct state.
//              (Note that the "enabled" status of the "Undo" button may have
//               changed and this will be reflected on this display link pass as well)
//
//   => [Phase] (Broken into sub-phases, which will all have linear animation curve and same timing)
//        [Subphase] The top 3 toolbars of the menu (or entire top menu for iphone)
//                   Switch to "Graph Mode" ... The tool bars DO NOT CHANGE CONTENT...
//        [Subphase] The bottom 3 toolbars of the menu (or entire bottom menu for iphone)
//                   Switch to their appropriate content for whichever weight sub-mode we have selected...
//        [Subphase]
//          [Subsubphase] If the iPhone menu is not expanded, we expand to 'graph height'
//          [Subsubphase] If the iPhone menu is expanded, we adjust height to 'graph height'
//        [Subphase] The scene mode animates to "split view" for "display mode"

class ToolAction {
    
    var phases = [ToolActionPhase]()
    private(set) var isComplete: Bool = false
    
    private var index: Int = 0
    
    init(phases: [ToolActionPhase]) {
        self.phases.append(contentsOf: phases)
    }
    
    init(phase: ToolActionPhase) {
        self.phases.append(phase)
    }
    
    func getPhase() -> ToolActionPhase? {
        if index >= 0 && index < phases.count {
            return phases[index]
        }
        return nil
    }
    
    func advance() {
        index += 1
        if index >= phases.count {
            isComplete = true
        }
    }
}

extension ToolAction: CustomStringConvertible {
    
    var description: String {
        var result = "Tool Action [phases: \(phases.count)] [complete: \(isComplete)]"
        result += "\n"
        
        for phase in phases {
            result += "\(phase)"
        }
        
        return result
    }
    
}
