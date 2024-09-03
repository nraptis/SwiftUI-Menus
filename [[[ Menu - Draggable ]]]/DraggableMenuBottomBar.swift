//
//  TabletInterfaceMenuBottomBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/20/24.
//

import UIKit

class DraggableMenuBottomBar: UIView {

    lazy var materialViewDarkMode: MaterialView = {
        let result = MaterialView(material: .regular,
                                  opacity: 0.76,
                                  color: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4),
                                  interfaceStyle: .light)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var materialViewLightMode: MaterialView = {
        let result = MaterialView(material: .thick,
                                  opacity: 0.8,
                                  color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6),
                                  interfaceStyle: .dark)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    func handleDarkModeDidChange() {
        if ApplicationController.isDarkModeEnabled {
            materialViewDarkMode.activate()
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
            materialViewLightMode.activate()
        }
    }
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        addSubview(materialViewLightMode)
        addConstraints([
            NSLayoutConstraint(item: materialViewLightMode, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        addSubview(materialViewDarkMode)
        addConstraints([
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        if ApplicationController.isDarkModeEnabled {
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
