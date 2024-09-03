//
//  MaterialView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/17/24.
//

import UIKit
import SwiftUI

class MaterialView: UIView {
    
    struct BackgroundView: View {
        let material: Material
        let opacity: CGFloat
        var body: some View {
            Rectangle().foregroundStyle(material.opacity(opacity))
        }
    }
    
    lazy var backgroundViewController: UIHostingController<BackgroundView> = {
        var result = UIHostingController(rootView: BackgroundView(material: material,
                                                                  opacity: opacity),
                                         ignoreSafeArea: true)
        result.view.backgroundColor = .clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        result.overrideUserInterfaceStyle = interfaceStyle
        return result
    }()
    
    let material: Material
    let interfaceStyle: UIUserInterfaceStyle
    let opacity: CGFloat
    let color: UIColor
    init(material: Material,
         opacity: CGFloat,
         color: UIColor,
         interfaceStyle: UIUserInterfaceStyle) {
        self.material = material
        self.opacity = opacity
        self.color = color
        self.interfaceStyle = interfaceStyle
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        backgroundColor = color
        
        if let backgroundView = backgroundViewController.view {
            addSubview(backgroundView)
            addConstraints([
                NSLayoutConstraint(item: backgroundView, attribute: .left, relatedBy: .equal, toItem: self,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: backgroundView, attribute: .right, relatedBy: .equal, toItem: self,
                                   attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self,
                                   attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: backgroundView, attribute: .bottom, relatedBy: .equal, toItem: self,
                                   attribute: .bottom, multiplier: 1.0, constant: 0.0),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
