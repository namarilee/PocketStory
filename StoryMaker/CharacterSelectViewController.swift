//
//  CharacterSelectViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 3/3/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class CharacterSelectViewController: UIViewController {

    @IBOutlet weak var pupButton: UIButton!

    @IBOutlet weak var whiskersButton: UIButton!
    
    @IBOutlet weak var bessieButton: UIButton!

    let chooseButton = UIButton(type: UIButton.ButtonType.custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        chooseButton.isHidden = true

        pupButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        pupButton.translatesAutoresizingMaskIntoConstraints = true
        whiskersButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        whiskersButton.translatesAutoresizingMaskIntoConstraints = true
        bessieButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        bessieButton.translatesAutoresizingMaskIntoConstraints = true
    }

    @IBAction func pupButtonClicked(_ sender: UIButton) {
        UserAnswers.character = "dog"
        pupButton.setImage(UIImage(named: "dogSelected"), for: .normal)
        whiskersButton.setImage(UIImage(named: "catButton"), for: .normal)
        bessieButton.setImage(UIImage(named: "cowButton"), for: .normal)

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.whiskersButton.transform = .identity
            self.bessieButton.transform = .identity
            self.pupButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        showChooseButton()
    }

    @IBAction func whiskersButtonClicked(_ sender: UIButton) {
        UserAnswers.character = "cat"
        whiskersButton.setImage(UIImage(named: "catSelected"), for: .normal)
        pupButton.setImage(UIImage(named: "dogButton"), for: .normal)
        bessieButton.setImage(UIImage(named: "cowButton"), for: .normal)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.bessieButton.transform = .identity
            self.pupButton.transform = .identity
            self.whiskersButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func bessieButtonClicked(_ sender: UIButton) {
        UserAnswers.character = "cow"
        bessieButton.setImage(UIImage(named: "cowSelected"), for: .normal)
        pupButton.setImage(UIImage(named: "dogButton"), for: .normal)
        whiskersButton.setImage(UIImage(named: "catButton"), for: .normal)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pupButton.transform = .identity
            self.whiskersButton.transform = .identity
            self.bessieButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        chooseButton.isHidden = true
        pupButton.setImage(UIImage(named: "dogButton"), for: .normal)
        whiskersButton.setImage(UIImage(named: "catButton"), for: .normal)
        bessieButton.setImage(UIImage(named: "cowButton"), for: .normal)

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pupButton.transform = .identity
            self.whiskersButton.transform = .identity
            self.bessieButton.transform = .identity
        })
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
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParkLunchViewController") as! ParkLunchViewController
        self.present(nextViewController, animated:false, completion:nil)
    }

}

struct Pup {
    static let name = "Pup"
    static let answer = "dog"
    static let imageName = "dog"
}

struct Whiskers {
    static let name = "Whiskers"
    static let answer = "cat"
    static let imageName = "cat"
}

struct Bessie {
    static let name = "Bessie"
    static let answer = "cow"
    static let imageName = "cow"
}
