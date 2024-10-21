//
//  TopMenuStandardContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/3/24.
//

import UIKit

class TopMenuStandardContainerView: UIView, PrimaryMenuStandardContainerConforming {
    
    func handleSelectedJiggleDidChange() {
        print("TopMenuStandardContainerView => handleSelectedJiggleDidChange")
        timeLineContainerView.handleSelectedJiggleDidChange()
    }
    
    func handleSelectedSwatchDidChange() {
        print("TopMenuStandardContainerView => handleSelectedSwatchDidChange")
        timeLineContainerView.handleSelectedSwatchDidChange()
    }
    
    var isModeAnimating = false
    
    lazy var topMenuViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: topMenuView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var topMenuView: TopMenuTopMenuView = {
        let result = TopMenuTopMenuView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    
    lazy var graphContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: graphContainerView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var graphContainerView: TopMenuGraphContainerView = {
        let result = TopMenuGraphContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    
    lazy var timeLineContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: timeLineContainerView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var timeLineContainerView: TopMenuTimeLineContainerView = {
        let result = TopMenuTimeLineContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    
    func handleDarkModeDidChange() {
        graphContainerView.handleDarkModeDidChange()
        timeLineContainerView.handleDarkModeDidChange()
        topMenuView.handleDarkModeDidChange()
    }
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeArea(width: Int, safeAreaLeft: Int, safeAreaRight: Int, safeAreaTop: Int) {
        graphContainerView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                          safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        timeLineContainerView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                             safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        topMenuView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                   safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
    }
    
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaTop: Int) {
        
        let orientation = toolInterfaceViewModel.orientation
        let topMenuHeight = MenuHeightCategoryPhoneTop.get(category: .standard, orientation: orientation)
        let graphMenuHeight = MenuHeightCategoryPhoneTop.get(category: .graph, orientation: orientation)
        let timeLineMenuHeight = MenuHeightCategoryPhoneTop.get(category: .timeLine, orientation: orientation)
        
        
        addSubview(topMenuView)
        addConstraints([
            topMenuViewLeftConstraint,
            NSLayoutConstraint(item: topMenuView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topMenuView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0)
        ])
        topMenuView.addConstraint(NSLayoutConstraint(item: topMenuView, attribute: .height,
                                                              relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                              multiplier: 1.0, 
                                                     constant: CGFloat(topMenuHeight)))
        
        addSubview(graphContainerView)
        addConstraints([
            graphContainerViewLeftConstraint,
            NSLayoutConstraint(item: graphContainerView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0)
        ])
        graphContainerView.addConstraint(NSLayoutConstraint(item: graphContainerView, attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: CGFloat(graphMenuHeight)))
        
        addSubview(timeLineContainerView)
        addConstraints([
            timeLineContainerViewLeftConstraint,
            NSLayoutConstraint(item: timeLineContainerView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, 
                               constant: 0.0),
            NSLayoutConstraint(item: timeLineContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0)
        ])
        timeLineContainerView.addConstraint(NSLayoutConstraint(item: timeLineContainerView, attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: CGFloat(timeLineMenuHeight)))
        
        graphContainerView.setup(width: width, safeAreaLeft: safeAreaLeft,
                                 safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        timeLineContainerView.setup(width: width, safeAreaLeft: safeAreaLeft,
                                    safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        topMenuView.setup(width: width, safeAreaLeft: safeAreaLeft,
                          safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
    }
    
    func getSecondaryMenu() -> (any MenuPartWithRowsConforming)? {
        nil
    }
    
}
