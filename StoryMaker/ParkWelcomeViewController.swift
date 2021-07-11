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

    @IBOutlet weak var speechBubble: UIImageView!

    @IBOutlet weak var introLabel: AnimatedUILabel!

    @IBOutlet weak var promptButton: UIButton!

    let characterImage =  UIImageView()

    var showCharacterWorkItem: DispatchWorkItem?

    var showSpeechBubbleWorkItem: DispatchWorkItem?

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    var showPromptButtenWorkItem: DispatchWorkItem?

    var promptCount = 0
    
    
    // TODO: Currently not used yet
    let playMyStoryButton = UIButton(type: UIButton.ButtonType.custom)

    // TODO: Currently not used yet
    let chosenCharacter =  UIImageView()

    // TODO: Currently not used yet
    let dogHappy = UIImageView()

    // TODO: Currently not used yet
    let storyTitle = UILabel()

    // TODO: Currently not used yet
    let captionRect = UIImageView()

    // TODO: Currently not used yet
    let captionLabel = AnimatedUILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.isHidden = true
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.image = UIImage(named: Pup.imageName)
        view.addSubview(characterImage)
        speechBubble.isHidden = true
        speechBubble.translatesAutoresizingMaskIntoConstraints = true
        introLabel.isHidden = true
        introLabel.translatesAutoresizingMaskIntoConstraints = true
        promptButton.isHidden = true
        promptButton.translatesAutoresizingMaskIntoConstraints = true

        showCharacter()

        showSpeechBubble()

        addMessageToSpeechBubble("Welcome to the " + AmusementPark.name + "!")

        showPromptButton(image: UIImage(named: "hello")!, delay: 7)
    }
    
    
//    @IBAction func backButtonClicked(_ sender: Any) {
//        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "BackgroundSelect") as! BackgroundSelect
//        self.present(nextViewController, animated:false, completion:nil)
//    }
    
    func showCharacter() {
        NSLayoutConstraint.activate([
            characterImage.heightAnchor.constraint(equalTo: characterImage.widthAnchor, multiplier: 150.0/100.0),
            characterImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            NSLayoutConstraint(item: characterImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 0.57, constant: 0),
            NSLayoutConstraint(item: characterImage, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 2.5, constant: 0)
        ])
        showCharacterWorkItem = DispatchWorkItem {
            self.characterImage.isHidden = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.characterImage.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.35))
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: showCharacterWorkItem!)
    }

    func showSpeechBubble() {
        showSpeechBubbleWorkItem = DispatchWorkItem {
            self.speechBubble.isHidden = false
            self.speechBubble.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: showSpeechBubbleWorkItem!)
    }

    func addMessageToSpeechBubble(_ message: String) {
        introLabel.text = message
        addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: addMessageToSpeechBubbleWorkItem!)
    }

    func showPromptButton(image: UIImage, delay: Double) {
        promptButton.transform = .identity
        promptButton.setImage(image, for: .normal)
        
        showPromptButtenWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.promptButton)
            self.promptButton.isHidden = false
            self.promptButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.promptButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showPromptButtenWorkItem!)
        promptButton.addTarget(self, action: #selector(promptButtonClicked), for: .touchUpInside)
    }
    
    @IBAction func promptButtonClicked(_ sender: UIButton) {
        promptButton.isHidden = true
        promptCount += 1
        
        if promptCount == 1 {
            introLabel.text = "Let's choose a character!"
            introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
            
            showPromptButton(image: UIImage(named: "Next button")!, delay: 3)
        }

        if promptCount == 2 {
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "CharacterSelectViewController") as! CharacterSelectViewController
            self.present(nextViewController, animated:false, completion:nil)

            // TODO: Create PlayMyStoryViewController for the below
//            let playImage = UIImage(named: "play my story button")
//            playMyStoryButton.frame = CGRect(x: 500, y: 150, width: 240, height: 180)
//            playMyStoryButton.setImage(playImage, for: .normal)
//            playMyStoryButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        }
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        characterImage.layer.removeAllAnimations()
        showCharacterWorkItem?.perform()
        showCharacterWorkItem?.cancel()
        showSpeechBubbleWorkItem?.perform()
        showSpeechBubbleWorkItem?.cancel()
        speechBubble.layer.removeAllAnimations()
        addMessageToSpeechBubbleWorkItem?.perform()
        addMessageToSpeechBubbleWorkItem?.cancel()
        introLabel.stopAnimation()
        showPromptButtenWorkItem?.perform()
        showPromptButtenWorkItem?.cancel()
    }

    // TODO: Create PlayMyStoryViewController for the below
    @IBAction func playButtonClicked(_ sender: UIButton) {
        characterAnimation()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        playMyStoryButton.isHidden = true
        storyTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 40)
        storyTitle.textAlignment = .center
        view.addSubview(storyTitle)
        showStoryTitle(Pup.name + "'s Amazing Day at the " + AmusementPark.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dogWalkLeft()
            self.storyTitle.isHidden = true
            self.view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
            self.showCaptionRect()
            self.captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
            self.view.addSubview(self.captionLabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.updateCaption(Pup.name + " had an amazing day at the " + AmusementPark.name + "!")
            }
        }
    }

    // TODO: Currently not used yet
    func showChosenBackground() {
        if UserAnswers.background == AmusementPark.answer {
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == School.answer {
            view.addBackground(imageName: School.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == Farm.answer {
            view.addBackground(imageName: Farm.imageName, contentMode: .scaleAspectFill)
        }
    }

    // TODO: Currently not used yet
    func showChosenCharacter() {
        if UserAnswers.character == Pup.answer {
            chosenCharacter.image = UIImage(named: Pup.imageName)
            view.addSubview(chosenCharacter)
        } else if UserAnswers.character == Whiskers.answer {
            chosenCharacter.image = UIImage(named: Whiskers.imageName)
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            view.addSubview(chosenCharacter)
        } else if UserAnswers.character == Bessie.answer {
            chosenCharacter.image = UIImage(named: Bessie.imageName)
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
        chosenCharacter.image = UIImage(named: Pup.imageName)
        view.addSubview(chosenCharacter)
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 100, y: -10)
        })
    }

    // TODO: Currently not used yet
    func showStoryTitle(_ title: String) {
        storyTitle.text = title
        storyTitle.adjustsFontSizeToFitWidth = true
        storyTitle.numberOfLines = 0
    }

    // TODO: Currently not used yet
    func showCaptionRect() {
        captionRect.image = UIImage(named: "captionRect")
        self.view.addSubview(self.captionRect)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
            self.captionRect.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }

    // TODO: Currently not used yet
    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }

}
