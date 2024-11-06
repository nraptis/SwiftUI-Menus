//
//  SideMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/18/24.
//

import UIKit
import SwiftUI

class SideMenuView: UIView {
    
    let sideMenuViewModel = SideMenuViewModel()
    
    var hostingController: UIViewController?
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    init(toolInterfaceViewModel: ToolInterfaceViewModel,
         orientation: Orientation) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        
        self.orientation = orientation
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //TODONR:
        //self.clipsToBounds = true
        
        self.backgroundColor = ToolInterfaceTheme._toolbarBackground
        
        hostingController = UIHostingController(rootView: SideMenuContentView(orientation: orientation)
            .environment(toolInterfaceViewModel)
            .environment(sideMenuViewModel)
        )
        
        if let hostingController = hostingController {
            if let hostingView = hostingController.view {
                hostingView.backgroundColor = .clear
                addSubview(hostingView)
                hostingView.translatesAutoresizingMaskIntoConstraints = false
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeArea(safeAreaLeft: Int, safeAreaRight: Int, safeAreaTop: Int, safeAreaBottom: Int) {
        
        
    }
    
}
