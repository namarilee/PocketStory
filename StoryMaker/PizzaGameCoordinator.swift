//
//  PizzaGameCoordinator.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PizzaGameCoordinator {
    private var parent: AbstractGamesViewController
    private var numSelectors: [Selector]
    private var pizzaGameView: PizzaGameView?
    
        
    init(parent: AbstractGamesViewController, numSelectors: [Selector]) {
        self.parent = parent
        self.numSelectors = numSelectors
    }
    
    func loadView() -> UIView {
        pizzaGameView = PizzaGameView(parent: parent, numSelectors: numSelectors)
        return pizzaGameView!
    }
    
    func isPizzaDisplayed(_ displayIndex: Int) -> Bool {
        return ((pizzaGameView?.isPizzaDisplayed(displayIndex)) != nil)
    }
    
    func handleNumClicked(_ buttonIndex: Int) {
        pizzaGameView?.handleNumClicked(buttonIndex)
    }
}
