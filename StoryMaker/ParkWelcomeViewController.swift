//
//  ParkWelcomeViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 3/3/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class ParkWelcomeViewController: UIViewController {

    let character =  UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        showCharacter()
    }
    
    func showCharacter() {
        view.addSubview(character)
        character.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            character.heightAnchor.constraint(equalTo: character.widthAnchor, multiplier: 150.0/100.0),
            character.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            NSLayoutConstraint(item: character, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 0.51, constant: 0),
            NSLayoutConstraint(item: character, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 2.5, constant: 0)
        ])
        character.image = UIImage(named: "dog")
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.character.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.35))
        })
    }

}
