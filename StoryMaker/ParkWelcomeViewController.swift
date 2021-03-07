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

    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.isHidden = true
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.image = UIImage(named: "dog")
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
//    @IBAction func playButtonClicked(_ sender: UIButton) {
//        characterAnimation()
//        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
//        self.hideButtonQuestions()
//        self.playMyStoryButton.isHidden = true
//        storyTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 40)
//        storyTitle.textAlignment = .center
//        view.addSubview(storyTitle)
//        showStoryTitle(Pup.name + "'s Amazing Day at the " + AmusementPark.name)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.dogWalkLeft()
//            self.storyTitle.isHidden = true
//            self.view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
//            self.showCaptionRect()
//            self.captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
//            self.view.addSubview(self.captionLabel)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                self.updateCaption(Pup.name + " had an amazing day at the " + AmusementPark.name + "!")
//            }
//        }
//    }

}
