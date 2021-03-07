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

    // TODO: Currently not used yet
    let chosenCharacter =  UIImageView()

    // TODO: Currently not used yet
    let dogHappy = UIImageView(frame: CGRect(x: 125, y: 260, width: 92, height: 136.36))

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
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.whiskersButton.transform = .identity
            self.bessieButton.transform = .identity
            self.pupButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        showChooseButton()
    }

    @IBAction func whiskersButtonClicked(_ sender: UIButton) {
        UserAnswers.character = "cat"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.bessieButton.transform = .identity
            self.pupButton.transform = .identity
            self.whiskersButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func bessieButtonClicked(_ sender: UIButton) {
        UserAnswers.character = "cow"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pupButton.transform = .identity
            self.whiskersButton.transform = .identity
            self.bessieButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        chooseButton.isHidden = true

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

    // TODO: Currently not used yet
    func showChosenCharacter() {
        if UserAnswers.character == "dog" {
            chosenCharacter.image = UIImage(named: "dog")
            view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cat" {
            chosenCharacter.image = UIImage(named: "cat")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cow" {
            chosenCharacter.image = UIImage(named: "cow")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            view.addSubview(chosenCharacter)
        }
    }

    // TODO: Currently not used yet
    func characterAnimation() {
        showChosenCharacter()
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 0, y: -200)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.chosenCharacter.isHidden = true
            self.dogHappy.image = UIImage(named: "dogHappy")
            self.view.addSubview(self.dogHappy)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.repeat, .autoreverse], animations: {
                self.dogHappy.transform = CGAffineTransform(translationX: 0, y: -10)
            })
            UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.dogHappy.alpha = 0
            })
        }
    }

    // TODO: Currently not used yet
    func dogWalkLeft() {
        chosenCharacter.image = UIImage(named: "dog")
        view.addSubview(chosenCharacter)
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 100, y: -10)
        })
    }

}
