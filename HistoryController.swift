//
//  HistoryController.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

class HistoryController {
    
    var historyStack = [HistoryState]()
    var historyIndex: Int = 0
    var isMostRecentActionUndo = false
    var isMostRecentActionRedo = false
    weak var jiggleViewController: JiggleViewController?
    init(jiggleViewController: JiggleViewController) {
        self.jiggleViewController = jiggleViewController
    }
    
    private var __tempHistoryStack = [HistoryState]()
    func addHistoryState(_ historyState: HistoryState) -> Void {
        
        print("added history state: \(historyState.historyStateType)")
        
        __tempHistoryStack.removeAll(keepingCapacity: true)
        var index = historyIndex
        if isMostRecentActionUndo == false {
            index += 1
        }
        if index > 0 {
            if index > historyStack.count { index = historyStack.count }
            for i in 0..<(index) {
                __tempHistoryStack.append(historyStack[i])
            }
        }
        
        __tempHistoryStack.append(historyState)
        historyIndex = __tempHistoryStack.count
        historyStack.removeAll(keepingCapacity: true)
        historyStack.append(contentsOf: __tempHistoryStack)
        isMostRecentActionUndo = false
        isMostRecentActionRedo = false
    }
    
    func canUndo() -> Bool {
        if historyStack.count > 0 {
            if isMostRecentActionRedo {
                return (historyIndex >= 0 && historyIndex < historyStack.count)
            } else {
                return (historyIndex > 0 && historyIndex <= historyStack.count)
            }
        }
        return false
    }
    
    func canRedo() -> Bool {
        if historyStack.count > 0 {
            if isMostRecentActionUndo {
                return (historyIndex >= 0 && historyIndex < historyStack.count)
            } else {
                return (historyIndex >= 0 && historyIndex < (historyStack.count - 1))
            }
        }
        return false
    }
    
    @MainActor func undo() {
        let index = isMostRecentActionRedo ? historyIndex : (historyIndex - 1)
        let historyState = historyStack[index]
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.enterHistoryUndo(historyState)
        }
        historyIndex = index
        isMostRecentActionUndo = true
        isMostRecentActionRedo = false
    }
    
    @MainActor func redo() {
        let index = isMostRecentActionUndo ? historyIndex : (historyIndex + 1)
        let historyState = historyStack[index]
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.enterHistoryRedo(historyState)
        }
        historyIndex = index
        isMostRecentActionUndo = false
        isMostRecentActionRedo = true
    }
    
}
