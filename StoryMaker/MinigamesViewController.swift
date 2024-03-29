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

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var greatJobImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func getGreatJobImageView() -> UIImageView {
        return self.greatJobImageView
    }

    @IBAction func pizzaGameClicked(_ sender: Any) {
        ViewController.instance.pauseSound()
              ViewController.instance.playSound(soundFile: "foodcourtost")
        pizzaGameCoordinator = PizzaGameCoordinator(parent: self, numSelectors: numSelectors)
        view = pizzaGameCoordinator?.loadView()
        backButton.isHidden = false

    }
    
    
    @IBAction func hotdogGameClicked(_ sender: Any) {
        backButton.isHidden = false
        ViewController.instance.pauseSound()
              ViewController.instance.playSound(soundFile: "foodcourtost")
        hotdogGameCoordinator = HotdogGameCoordinator(parent: self, numSelectors: numSelectors)
        view = hotdogGameCoordinator?.loadView()
    }
    
    @IBAction func popcornGameClicked(_ sender: Any) {
        backButton.isHidden = false
        ViewController.instance.pauseSound()
              ViewController.instance.playSound(soundFile: "foodcourtost")
        popcornGameCoordinator = PopcornGameCoordinator(parent: self)
        view = popcornGameCoordinator?.loadView()
    }
    
    
    @IBAction func keyboardButtonClicked(_ sender: Any) {
        ViewController.instance.pauseSound()

    }
}
