//
//  MinigamesViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 6/13/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class MinigamesViewController: AbstractGamesViewController {

    var popcornGameCoordinator: PopcornGameCoordinator? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pizzaGameClicked(_ sender: Any) {
        pizzaGameCoordinator = PizzaGameCoordinator(parent: self, numSelectors: numSelectors)
        view = pizzaGameCoordinator?.loadView()
    }
    
    
    @IBAction func hotdogGameClicked(_ sender: Any) {
        hotdogGameCoordinator = HotdogGameCoordinator(parent: self, numSelectors: numSelectors)
        view = hotdogGameCoordinator?.loadView()
    }
}
