//
//  ToolInterfaceViewModel+PublisherActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAllRows() -> [ToolRow] {
        var result = [ToolRow]()
        result.append(contentsOf: rowsZoom)
        result.append(contentsOf: rowsGraphSideMenu)
        result.append(contentsOf: rowsVideoRecord)
        result.append(contentsOf: rowsVideoExport)
        if Device.isPad {
            result.append(contentsOf: rowsDraggable)
        } else {
            result.append(contentsOf: rowsTop)
            result.append(contentsOf: rowsBottom)
        }
        return result
    }
    
    func handleSelectedJiggleDidChange() {
        func handleSelectedJiggleDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .sliderJigglePower ||
                    node.element == .sliderJiggleSpeed ||
                    node.element == .sliderJiggleDampen ||
                    node.element == .textIconButtonFreezeOnSelectedJiggle ||
                    node.element == .enterModeZoomEnter ||
                    node.element == .enterModeGraphEnter ||
                    node.element == .enterModeGuidesEnter
                
                {
                    node.magicalViewModel.refresh()
                }
            }
        }
        
        for row in getAllRows() { handleSelectedJiggleDidChange(row: row) }
    }
    
    func handleZoomEnabledDidChange() {
        func handleZoomEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxZoomEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        
        for row in getAllRows() { handleZoomEnabledDidChange(row: row) }
        
    }
    
    
    
    func handleResetZoomActiveDidChange() {
        func handleResetZoomActiveDidChange(row: ToolRow) {
            for node in row.nodes {
                //if node.element == .OLDcheckBoxZoomEnabled {
                //    node.magicalViewModel.refresh()
                //}
            }
        }
        for row in getAllRows() { handleResetZoomActiveDidChange(row: row) }
    }
    
    func handleWeightCurveGraphEnabledDidChange() {
        func handleWeightCurveGraphEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxWeightCurveGraphEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleWeightCurveGraphEnabledDidChange(row: row) }
    }
    
    func handleGuidesEnabledDidChange() {
        func handleGuidesEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleGuidesEnabledDidChange(row: row) }
    }
    
    func handleAutoLoopEnabledDidChange() {
        func handleAutoLoopEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxAutoLoopEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAutoLoopEnabledDidChange(row: row) }
    }
    
    func handleCreateJiggleCentersModificationDidChange() {
        print("handleCreateJiggleCentersModificationDidChange")
        func handleCreateJiggleCentersModificationDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateJiggleCentersModificationDidChange(row: row) }
    }
    
    func handleCreateGuideCentersModificationDidChange() {
        print("handleCreateJiggleCentersModificationDidChange")
        func handleCreateGuideCentersModificationDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateGuideCentersModificationDidChange(row: row) }
    }
    
    func handleCreateJiggleStandardDidChange() {
        print("handleCreateJiggleStandardDidChange")
        func handleCreateJiggleStandardDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateJiggleStandardDidChange(row: row) }
    }
    
    func handleJigglesDidChange() {
        print("handleCreateJiggleDrawingDidChange")
        func handleJigglesDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleJigglesDidChange(row: row) }
    }
    
    func handleCreateJiggleDrawingDidChange() {
        print("handleCreateJiggleDrawingDidChange")
        func handleCreateJiggleDrawingDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateJiggleDrawingDidChange(row: row) }
    }
    
    func handleCreatePointsDidChange() {
        print("handleCreatePointsDidChange")
        func handleCreatePointsDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreatePointsDidChange(row: row) }
    }
    
    func handleRemovePointsDidChange() {
        print("handleRemovePointsDidChange")
        func handleRemovePointsDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleRemovePointsDidChange(row: row) }
    }
    
    func handleCreateWeightRingsStandardDidChange() {
        print("handleCreateWeightRingsStandardDidChange")
        func handleCreateWeightRingsStandardDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateWeightRingsStandardDidChange(row: row) }
    }
    
    func handleCreateWeightRingsDrawingDidChange() {
        print("handleCreateWeightRingsDrawingDidChange")
        func handleCreateWeightRingsDrawingDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateWeightRingsDrawingDidChange(row: row) }
    }
    
    func handleCreateWeightRingPointsDidChange() {
        print("handleCreateWeightRingPointsDidChange")
        func handleCreateWeightRingPointsDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleCreateWeightRingPointsDidChange(row: row) }
    }
    
    func handleRemoveWeightRingPointsDidChange() {
        print("handleRemoveWeightRingPointsDidChange")
        func handleRemoveWeightRingPointsDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        for row in getAllRows() { handleRemoveWeightRingPointsDidChange(row: row) }
    }
    
    func handleDocumentModeDidChange() {
        func handleDocumentModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .mainTabDocumentMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleDocumentModeDidChange(row: row) }
    }
    
    func handleEditModeDidChange() {
        func handleEditModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentEditMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleEditModeDidChange(row: row) }
    }
    
    func handleDisplayModeDidChange() {
        func handleDisplayModeDidChange(row: ToolRow) {
            for node in row.nodes {
                
            }
        }
        for row in getAllRows() { handleDisplayModeDidChange(row: row) }
    }
    
    func handlePointCreateModeDidChange() {
        func handlePointCreateModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentPointCreateMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handlePointCreateModeDidChange(row: row) }
    }
    
    func handleAnimationModeDidChange() {
        func handleAnimationModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentAnimationMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAnimationModeDidChange(row: row) }
    }
    
    func handleViewModeDidChange() {
        func handleViewModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentViewMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleViewModeDidChange(row: row) }
    }
    
    func handleWeightPointCreateModeDidChange() {
        func handleWeightPointCreateModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentWeightPointCreateMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleWeightPointCreateModeDidChange(row: row) }
    }
    
    func handlePointModeDidChange() {
        func handlePointModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentPointMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handlePointModeDidChange(row: row) }
    }
    
    func handleWeightPointModeDidChange() {
        func handleWeightPointModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentWeightPointMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleWeightPointModeDidChange(row: row) }
    }
    
    func handleWeightModeDidChange() {
        func handleWeightModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .segmentWeightMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleWeightModeDidChange(row: row) }
    }
    
    func handleUndoRedoDidChange() {
        func handleUndoRedoDidChange(row: ToolRow) {
            for node in row.nodes {
                if (node.element == .textIconButtonUndo) || (node.element == .textIconButtonRedo) {
                    node.magicalViewModel.refresh()
                }
                
                if (node.element == .sexyButtonRedo) || (node.element == .sexyButtonUndo) {
                    node.magicalViewModel.refresh()
                }
                
            }
        }
        for row in getAllRows() { handleUndoRedoDidChange(row: row) }
    }
    
    func handleDarkModeDidChange() {
        print("handleDarkModeDidChange")
        func handleDarkModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxDarkModeEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleDarkModeDidChange(row: row) }
    }
    
    func handleFrozenJigglesDidChange() {
        print("handleFrozenJigglesDidChange")
        func handleFrozenJigglesDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .textIconButtonFreezeOnSelectedJiggle ||
                    node.element == .textIconButtonFreezeOffAllJiggle {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleFrozenJigglesDidChange(row: row) }
    }
    
    func handleSwivelOrbitDidChange() {
        print("handleSwivelOrbitDidChange")
        func handleSwivelOrbitDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxSwivelOrbitEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleSwivelOrbitDidChange(row: row) }
    }
    
    func handleStereoscopicDidChange() {
        print("handleStereoscopicDidChange")
        
        func handleStereoscopicDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxStereoscopicEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleStereoscopicDidChange(row: row) }
    }
    
    func handleAnimationJiggleAppliedToAllDidChange() {
        print("handleAnimationJiggleAppliedToAllDidChange")
        
        func handleAnimationJiggleAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxAnimationJiggleApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAnimationJiggleAppliedToAllDidChange(row: row) }
    }
    
    func handleAnimationBounceAppliedToAllDidChange() {
        print("handleAnimationBounceAppliedToAllDidChange")
        
        func handleAnimationBounceAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxAnimationBounceApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAnimationBounceAppliedToAllDidChange(row: row) }
    }
    
    func handleAnimationWobbleAppliedToAllDidChange() {
        print("handleAnimationWobbleAppliedToAllDidChange")
        
        func handleAnimationWobbleAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxAnimationWobbleApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAnimationWobbleAppliedToAllDidChange(row: row) }
    }
    
    func handleAnimationTwistAppliedToAllDidChange() {
        print("handleAnimationTwistAppliedToAllDidChange")
        
        func handleAnimationTwistAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .checkBoxAnimationTwistApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleAnimationTwistAppliedToAllDidChange(row: row) }
    }
    
    func handleJiggleSpeedDidChange() {
        print("handleJiggleSpeedDidChange")
        
        func handleJiggleSpeedDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .sliderJiggleSpeed {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleJiggleSpeedDidChange(row: row) }
    }
    
    func handleJigglePowerDidChange() {
        print("handleJiggleSpeedChange")
        
        func handleJigglePowerDidChange(row: ToolRow) {
            for node in row.nodes {
                if node.element == .sliderJigglePower {
                    node.magicalViewModel.refresh()
                }
            }
        }
        for row in getAllRows() { handleJigglePowerDidChange(row: row) }
    }
}
