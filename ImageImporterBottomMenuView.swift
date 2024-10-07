//
//  ImageImporterBottomMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import UIKit
import SwiftUI

class ImageImporterBottomMenuView: UIView {
    
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
    
    lazy var bottomMenuContentView: ImageImporterBottomMenuContentView = {
        let result = ImageImporterBottomMenuContentView(imageImportViewModel: imageImportViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        let numberOfRows = result.getNumberOfRows()
        let height = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation,
                                                   rowCount: numberOfRows,
                                                   isTop: false)
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
            safeAreaPaddingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            safeAreaPaddingView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            safeAreaPaddingView.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        ])
        safeAreaPaddingView.addConstraint(safeAreaPaddingViewHeightConstraint)
        
        containerView.addSubview(contentView)
        containerView.addConstraints([
            contentView.bottomAnchor.constraint(equalTo: safeAreaPaddingView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        contentView.addSubview(bottomMenuContentView)
        
        contentView.addConstraints([
            bottomMenuContentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bottomMenuContentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bottomMenuContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomMenuContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeAreaChanged(safeAreaLeft: Int,
                               safeAreaRight: Int,
                               safeAreaBottom: Int) {
        
        safeAreaPaddingViewHeightConstraint.constant = CGFloat(safeAreaBottom)
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ImageImporterBottomMenuView")
        }
    }
}
