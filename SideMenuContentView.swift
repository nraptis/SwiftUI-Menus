//
//  SideMenuContentView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/18/24.
//

import SwiftUI

struct SideMenuContentView: View {
    
    
    @Environment(ToolInterfaceViewModel.self) var toolInterfaceViewModel: ToolInterfaceViewModel
    @Environment(SideMenuViewModel.self) var sideMenuViewModel: SideMenuViewModel
    
    let orientation: Orientation
    init(orientation: Orientation) {
        self.orientation = orientation
    }
    
    var body: some View {
        
        let containerWidth = sideMenuViewModel.containerWidth
        let containerHeight = sideMenuViewModel.containerHeight
        
        let safeAreaLeft = sideMenuViewModel.safeAreaLeft
        let safeAreaTop = sideMenuViewModel.safeAreaTop
        let safeAreaBottom = sideMenuViewModel.safeAreaBottom
        
        let contentWidth = containerWidth - safeAreaLeft
        let contentHeight = (containerHeight - (safeAreaTop + safeAreaBottom))
        
        return HStack(spacing: 0.0) {
            
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(safeAreaLeft), height: CGFloat(containerHeight - 32))
                .background(Color.red)
            
            VStack(spacing: 0.0) {
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(containerWidth - safeAreaLeft - 32),
                           height: CGFloat(safeAreaTop))
                    .background(Color.green)
                getContentView(width: contentWidth,
                               height: contentHeight)
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(containerWidth - safeAreaLeft - 32),
                           height: CGFloat(safeAreaBottom))
                    .background(Color.orange)
            }
        }
        .frame(width: CGFloat(containerWidth),
               height: CGFloat(containerHeight))
        .background(ToolInterfaceTheme.toolbarBackground)
        .edgesIgnoringSafeArea(.all)
    }
    
    func getContentView(width: Int, height: Int) -> some View {
        ZStack {
            VStack {
                Button {
                    toolInterfaceViewModel.toolActionSideMenuExit()
                } label: {
                    ZStack {
                        Text("Exit Menu")
                    }
                    .frame(width: CGFloat(width - 60), height: 80)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.gray))
                }
                .edgesIgnoringSafeArea(.all)
                
                Button {
                    toolInterfaceViewModel.dialogActionSaveJiggle()
                } label: {
                    ZStack {
                        Text("Save AI Model")
                    }
                    .frame(width: CGFloat(width - 60), height: 80)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.gray))
                }
                
                Button {
                    toolInterfaceViewModel.toolActionMainMenu()
                } label: {
                    ZStack {
                        Text("Go Main Menu")
                    }
                    .frame(width: CGFloat(width - 60), height: 80)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.gray))
                }
                .edgesIgnoringSafeArea(.all)
                
                Button {
                    toolInterfaceViewModel.toolActionSideMenuExit()
                } label: {
                    ZStack {
                        Text("Exit Menu")
                    }
                    .frame(width: CGFloat(width - 60), height: 80)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.gray))
                }
                .edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .background(ToolInterfaceTheme.blueBasic)
        .edgesIgnoringSafeArea(.all)
    }
    
}
