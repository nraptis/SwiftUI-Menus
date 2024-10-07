//
//  ImageImporterTopMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import UIKit
import SwiftUI

class ImageImporterTopMenuView: UIView {
    
    lazy var backgroundViewController: UIHostingController<DialogBoxBackgroundView> = {
        var result = UIHostingController(rootView: DialogBoxBackgroundView())
        result.view.backgroundColor = .clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var safeAreaPaddingViewHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: safeAreaPaddingView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0)
    }()
    
    lazy var safeAreaPaddingView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var contentView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var topMenuContentView: ImageImporterTopMenuContentView = {
        let result = ImageImporterTopMenuContentView(imageImportViewModel: imageImportViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        let numberOfRows = result.getNumberOfRows()
        let height = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation,
                                                   rowCount: numberOfRows,
                                                   isTop: true)
        result.addConstraint(NSLayoutConstraint(item: result, attribute: .height, relatedBy: .equal, toItem: nil,
                                                attribute: .notAnAttribute, multiplier: 1.0, 
                                                constant: CGFloat(height)))
        return result
    }()
    
    let imageImportViewModel: ImageImportViewModel
    init(imageImportViewModel: ImageImportViewModel) {
        self.imageImportViewModel = imageImportViewModel
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(containerView)
        addConstraints([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
        
        if let backgroundViewControllerView = backgroundViewController.view {
            containerView.addSubview(backgroundViewControllerView)
            containerView.addConstraints([backgroundViewControllerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                                          backgroundViewControllerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                                          backgroundViewControllerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                                          backgroundViewControllerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)])
        }
        
        containerView.addSubview(safeAreaPaddingView)
        containerView.addConstraints([
            safeAreaPaddingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            safeAreaPaddingView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            safeAreaPaddingView.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        ])
        safeAreaPaddingView.addConstraint(safeAreaPaddingViewHeightConstraint)
        
        containerView.addSubview(contentView)
        containerView.addConstraints([
            contentView.topAnchor.constraint(equalTo: safeAreaPaddingView.bottomAnchor),
            contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
        contentView.addSubview(topMenuContentView)
        
        contentView.addConstraints([
            topMenuContentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topMenuContentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            topMenuContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topMenuContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeAreaChanged(safeAreaLeft: Int,
                               safeAreaRight: Int,
                               safeAreaTop: Int) {
        safeAreaPaddingViewHeightConstraint.constant = CGFloat(safeAreaTop)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ImageImporterTopMenuView")
        }
    }
}
