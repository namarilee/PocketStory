//
//  HotdogGameCoordinator.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class HotdogGameCoordinator {
    private var parent: FoodSelectViewController
    private var numSelectors: [Selector]
    private var hotdogGameView: HotdogGameView?
    
    init(parent: FoodSelectViewController, numSelectors: [Selector]) {
        self.parent = parent
        self.numSelectors = numSelectors
    }
    
    func loadView() -> UIView {
        hotdogGameView = HotdogGameView(parent: parent, numSelectors: numSelectors)
        return hotdogGameView!
    }
    
    func isHotdogDisplayed(_ displayIndex: Int) -> Bool {
        return ((hotdogGameView?.isHotdogDisplayed(displayIndex)) != nil)
    }
    
    func handleNumClicked(_ buttonIndex: Int) {
        hotdogGameView?.handleNumClicked(buttonIndex)
    }

}
