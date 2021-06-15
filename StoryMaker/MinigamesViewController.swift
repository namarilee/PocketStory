//
//  MinigamesViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 6/13/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class MinigamesViewController: AbstractGamesViewController {

  //  var popcornGameCoordinator: PopcornGameCoordinator? = nil
//    var backButton = UIButton(type: UIButton.ButtonType.custom)
//    let imageName = UIImage(named: "back button")
//    backButton.setImage(imageName, for: .normal)
//
//    view.addSubview(backButton)
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
    }
    
    
    @IBAction func pizzaGameClicked(_ sender: Any) {
        pizzaGameCoordinator = PizzaGameCoordinator(parent: self, numSelectors: numSelectors)
        view = pizzaGameCoordinator?.loadView()
        backButton.isHidden = false

    }
    
    
    @IBAction func hotdogGameClicked(_ sender: Any) {
        backButton.isHidden = false

        hotdogGameCoordinator = HotdogGameCoordinator(parent: self, numSelectors: numSelectors)
        view = hotdogGameCoordinator?.loadView()
    }
    
    @IBAction func popcornGameClicked(_ sender: Any) {
        backButton.isHidden = false

        popcornGameCoordinator = PopcornGameCoordinator(parent: self)
        view = popcornGameCoordinator?.loadView()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MinigamesViewController") as! MinigamesViewController
              self.present(nextViewController, animated:false, completion:nil)
    }
    
}
