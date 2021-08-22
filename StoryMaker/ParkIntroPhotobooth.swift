//
//  ParkIntroPhotobooth.swift
//  StoryMaker
//
//  Created by Marina Lee on 7/14/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class ParkIntroPhotobooth: UIViewController {
    
    @IBOutlet weak var speechBubble: UIImageView!
    
    @IBOutlet weak var introLabel: AnimatedUILabel!
    
    @IBOutlet weak var promptButton: UIButton!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    let characterImage =  UIImageView()
    var showSpeechBubbleWorkItem: DispatchWorkItem?

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    var showPromptButtenWorkItem: DispatchWorkItem?
    var showCharacterWorkItem: DispatchWorkItem?
    var count = 0
    
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

         addMessageToSpeechBubble("That snack was delicious, wasn't it?")

           showPromptButton(image: UIImage(named: "Next button")!, delay: 7)
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
        count += 1
        if count == 1 {
            backgroundImg.image = UIImage(named: "amusementpark3photobooth")
            introLabel.text = "Let's end the day by taking a picture at the photobooth!"
            introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        showPromptButton(image: UIImage(named: "Next button")!, delay: 3)
        }
        if count == 2 {
            ViewController.instance.pauseSound()
            ViewController.instance.playSound(soundFile: "Bb major_1")
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoboothSelect") as! PhotoboothSelect
            self.present(nextViewController, animated:false, completion:nil)
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

}
