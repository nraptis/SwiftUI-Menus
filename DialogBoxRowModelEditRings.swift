//
//  DialogBoxRowModelEditRings.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/5/24.
//

import Foundation

class DialogBoxRowModelEditRings: DialogBoxRowModel {
    
    init() {
        super.init(rowModelType: .editRings)
    }
    
    override func dispose() {
        super.dispose()
        print("DialogBoxRowModelEditRings => Dispose")
    }
    
    private var isGenerating: Bool = false
    func generate() {
        
        if isGenerating { return }
        
        isGenerating = true
        
        let dialogBoxViews = ApplicationController.shared.dialogBoxViews
        
        var ringBuilderDialogBoxView: DialogBoxView?
        var ringBuilderViewController: RingBuilderViewController?
        
        for dialogBoxView in dialogBoxViews {
            for bodyRowView in dialogBoxView.bodyRowViews {
                if let dialogBoxRowViewEditRings = bodyRowView as? DialogBoxRowViewEditRings {
                    ringBuilderViewController = dialogBoxRowViewEditRings.ringBuilderViewController
                    ringBuilderDialogBoxView = dialogBoxView
                }
            }
        }
        
        guard let ringBuilderViewController = ringBuilderViewController, let ringBuilderDialogBoxView = ringBuilderDialogBoxView else {
            ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.unknownError) { _ in }
            return
        }
        
        guard let jiggleViewModel = ApplicationController.shared.jiggleViewModel else {
            ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.unknownError) { _ in }
            return
        }
        
        guard let selectedJiggle = jiggleViewModel.getSelectedJiggle() else {
            ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.noJiggleSelected) { _ in }
            return
        }
        
        ringBuilderDialogBoxView.loadingViewShow(text: GeneralStringLibrary.generalTextGeneratingGuides())
        
        let ringBuilder = RingBuilder()
        let ringBuilderWidget = ringBuilderViewController.ringBuilderRingView.ringBuilderWidget
        ringBuilder.compute_PartA(jiggle: selectedJiggle,
                                  angle: ringBuilderWidget.angle)
        
        Task {
            await ringBuilder.compute_PartB(magnitude: ringBuilderWidget.magnitude,
                                            numberOfRings: ringBuilderWidget.numberOfRings)
            await MainActor.run {
                let response = ringBuilder.compute_PartC(jiggleViewModel: jiggleViewModel)
                
                
                if response.numberOfRingsGenerated <= 0 {
                    ApplicationController.rootViewController.replaceDialogBox(DialogBoxModel.generatedNoGuides) { _ in
                        ringBuilderDialogBoxView.loadingViewHide()
                        self.isGenerating = false
                    }
                } else if response.numberOfRingsGenerated < response.numberOfRingsRequested {
                    ApplicationController.rootViewController.replaceDialogBox(DialogBoxModel.generatedLessGuides(numberOfRingsGenerated: response.numberOfRingsGenerated, numberOfRingsRequested: response.numberOfRingsRequested)) { _ in
                        ringBuilderDialogBoxView.loadingViewHide()
                        self.isGenerating = false
                    }
                } else {
                    ApplicationController.rootViewController.popDialogBox() { _ in
                        ringBuilderDialogBoxView.loadingViewHide()
                        self.isGenerating = false
                    }
                }
            }
        }
    }
}
