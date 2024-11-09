//
//  JiggleViewModel+CreateModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension JiggleViewModel {
    
    @MainActor func setCreatorMode(_ creatorMode: CreatorMode) {
        jiggleDocument.setCreatorMode(creatorMode)
    }
    
}
