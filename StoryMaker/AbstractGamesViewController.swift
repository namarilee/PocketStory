//
//  AbstractGamesViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 6/13/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit
class AbstractGamesViewController: UIViewController {
    
    var pizzaGameCoordinator: PizzaGameCoordinator!
    var hotdogGameCoordinator: HotdogGameCoordinator!
    var popcornGameCoordinator: PopcornGameCoordinator!
    static var instance: AbstractGamesViewController!

    let numSelectors = [#selector(num1Clicked), #selector(num2Clicked), #selector(num3Clicked), #selector(num4Clicked), #selector(num5Clicked)]
    let gameProgressBar = [UIImage(named: "p0"), UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3"), UIImage(named: "p4"), UIImage(named: "p5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AbstractGamesViewController.instance = self
    }

    func getGreatJobImageView() -> UIImageView {
        fatalError("This method must be overridden")
    }
    
    func photoboothIntro() {
        if BackgroundSelect.storyInProgress == true {

        ViewController.instance.stopSound()
        ViewController.instance.playSound(soundFile: "dixielandost (1)")
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParkIntroPhotobooth") as! ParkIntroPhotobooth
            self.present(nextViewController, animated:false, completion:nil)
        }
        if BackgroundSelect.storyInProgress == false {
            ViewController.instance.pauseSound()
            ViewController.instance.playSound(soundFile: "Eb ")
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MinigamesViewController") as! MinigamesViewController
            self.present(nextViewController, animated:false, completion:nil)
        }
    }
    
    @IBAction func num1Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(0)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(0)
        }
    }
    
    @IBAction func num2Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(1)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(1)
        }
    }
    
    @IBAction func num3Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(2)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(2)
        }
    }
    
    @IBAction func num4Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(3)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(3)
        }
    }
    
    @IBAction func num5Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(4)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(4)
        }
    }
}
