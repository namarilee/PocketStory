//
//  PopcornGameCoordinator.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PopcornGameCoordinator {
    private var parent: FoodSelectViewController
    private var popcornGameView: PopcornGameView?
    
    init(parent: FoodSelectViewController) {
        self.parent = parent
    }
    
    func loadView() -> UIView {
        popcornGameView = PopcornGameView(parent: parent)
        return popcornGameView!
    }

}
