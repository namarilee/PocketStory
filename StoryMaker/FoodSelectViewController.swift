//
//  FoodSelectViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/27/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class FoodSelectViewController: AbstractGamesViewController {

    @IBOutlet weak var pizzaButton: UIButton!

    @IBOutlet weak var hotdogButton: UIButton!

    @IBOutlet weak var popcornButton: UIButton!

    @IBOutlet weak var pizzaLabel: UILabel!

    @IBOutlet weak var hotdogLabel: UILabel!

    @IBOutlet weak var popcornLabel: UILabel!

    @IBOutlet weak var anywhereButton: UIButton!

    @IBOutlet weak var greatJobImageView: UIImageView!
    
    let chooseButton = UIButton(type: UIButton.ButtonType.custom)

   // var popcornGameCoordinator: PopcornGameCoordinator? = nil

    // TODO: Currently not used yet
    var chosenFood =  UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        chooseButton.isHidden = true

        pizzaLabel.adjustsFontSizeToFitWidth = true
        hotdogLabel.adjustsFontSizeToFitWidth = true
        popcornLabel.adjustsFontSizeToFitWidth = true

        pizzaButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        pizzaButton.translatesAutoresizingMaskIntoConstraints = true
        hotdogButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        hotdogButton.translatesAutoresizingMaskIntoConstraints = true
        popcornButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        popcornButton.translatesAutoresizingMaskIntoConstraints = true
    }

    override func getGreatJobImageView() -> UIImageView {
        return self.greatJobImageView
    }

    @IBAction func pizzaButtonClicked(_ sender: UIButton) {
        UserAnswers.food = "Pizza"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = .identity
            self.pizzaButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func hotdogButtonClicked(_ sender: UIButton) {
        UserAnswers.food = "Hotdog"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.popcornButton.transform = .identity
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func popcornButtonClicked(_ sender: UIButton) {
        UserAnswers.food = "Popcorn"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }
    
    func showChooseButton() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "selectButton")
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseButton.heightAnchor.constraint(equalTo: chooseButton.widthAnchor, multiplier: 51.0/190.0),
            chooseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NSLayoutConstraint(item: chooseButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.73, constant: 0)
        ])

        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
    }

    @IBAction func chooseButtonClicked(_ sender: UIButton) {

        if UserAnswers.food == Pizza.answer {
            pizzaGameCoordinator = PizzaGameCoordinator(parent: self, numSelectors: numSelectors)
            view = pizzaGameCoordinator?.loadView()
        }
        if UserAnswers.food == Hotdog.answer {
            hotdogGameCoordinator = HotdogGameCoordinator(parent: self, numSelectors: numSelectors)
            view = hotdogGameCoordinator?.loadView()
        }
        if UserAnswers.food == Popcorn.answer {
            popcornGameCoordinator = PopcornGameCoordinator(parent: self)
            view = popcornGameCoordinator?.loadView()
        }
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        chooseButton.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = .identity
        })
    }


    // TODO: Currently not used yet
    func showChosenFood() {
        if UserAnswers.food == Pizza.answer {
            chosenFood.image = UIImage(named: Pizza.imageName)
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == Hotdog.answer {
            chosenFood.image = UIImage(named: Hotdog.imageName)
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == Popcorn.answer {
            chosenFood.image = UIImage(named: Popcorn.imageName)
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          }
      }

}

struct Pizza {
    static let answer = "Pizza"
    static let imageName = "pizza"
}

struct Hotdog {
    static let answer = "Hotdog"
    static let imageName = "hotdog"
}

struct Popcorn {
    static let answer = "Popcorn"
    static let imageName = "popcorn"
}
