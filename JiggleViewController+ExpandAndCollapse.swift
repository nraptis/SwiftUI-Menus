//
//  JiggleViewController+ExpandAndCollapse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/4/24.
//

import UIKit

extension JiggleViewController {
    
    func toolActionPhoneToggleTopMenu() {
        if jiggleViewModel.isPhoneTopMenuExpanded {
            toolActionPhoneCollapseTopMenu()
        } else {
            toolActionPhoneExpandTopMenu()
        }
    }
    
    func toolActionPhoneToggleBottomMenu() {
        if jiggleViewModel.isPhoneBottomMenuExpanded {
            toolActionPhoneCollapseBottomMenu()
        } else {
            toolActionPhoneExpandBottomMenu()
        }
    }
    
    func toolActionPhoneExpandTopMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        if jiggleViewModel.isPhoneTopMenuExpanded == false {
            
            let toolAction = batchInterfaceAction(disableCreatorModes: false,
                                                  changeCommand: { configuration in
                configuration.isExpandedTop = true
                return [ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: true)]
            }, alongsideMeshCommand: {
                [ ]
            })
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneCollapseTopMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        if jiggleViewModel.isPhoneTopMenuExpanded == true {
            let toolAction = batchInterfaceAction(disableCreatorModes: false,
                                                  changeCommand: { configuration in
                configuration.isExpandedTop = false
                return [ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: false)]
            }, alongsideMeshCommand: {
                [ ]
            })
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneExpandBottomMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        if jiggleViewModel.isPhoneBottomMenuExpanded == false {
            
            let toolAction = batchInterfaceAction(disableCreatorModes: false,
                                                  changeCommand: { configuration in
                configuration.isExpandedBottom = true
                return [ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: true)]
            }, alongsideMeshCommand: {
                [ ]
            })
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneCollapseBottomMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        if jiggleViewModel.isPhoneBottomMenuExpanded == true {
            
            let toolAction = batchInterfaceAction(disableCreatorModes: false,
                                                  changeCommand: { configuration in
                configuration.isExpandedBottom = false
                return [ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: false)]
            }, alongsideMeshCommand: {
                [ ]
            })
            
            toolActionPerform(toolAction)
        }
    }
    
}
