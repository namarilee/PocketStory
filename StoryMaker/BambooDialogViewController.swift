//
//  BambooDialogViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/28/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class BambooDialogViewController: UIViewController {

    @IBOutlet weak var speechBubble: UIImageView!

    @IBOutlet weak var introLabel: AnimatedUILabel!
    
    @IBOutlet weak var promptButton: UIButton!

    var showSpeechBubbleWorkItem: DispatchWorkItem?

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    var showPromptButtonWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()

        speechBubble.isHidden = true
        speechBubble.translatesAutoresizingMaskIntoConstraints = true
        introLabel.isHidden = true
        introLabel.translatesAutoresizingMaskIntoConstraints = true
        if (UIScreen.main.traitCollection.verticalSizeClass == .compact) {
            introLabel.font = UIFont(name:"Arial Rounded MT Bold", size:18)
        } else {
            introLabel.font = UIFont(name:"Arial Rounded MT Bold", size:32)
        }
        promptButton.isHidden = true
        promptButton.translatesAutoresizingMaskIntoConstraints = true

        showSpeechBubble()
        addMessageToSpeechBubble("Hi! My name is Bamboo and I will be your server today.")
        showPromptButton(image: UIImage(named: "hello")!, delay: 7)
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
        introLabel.newText = message
        addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: addMessageToSpeechBubbleWorkItem!)
    }

    func showPromptButton(image: UIImage, delay: Double) {
        promptButton.transform = .identity
        promptButton.setImage(image, for: .normal)
        
        showPromptButtonWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.promptButton)
            self.promptButton.isHidden = false
            self.promptButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.promptButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showPromptButtonWorkItem!)
        promptButton.addTarget(self, action: #selector(promptButtonClicked), for: .touchUpInside)
    }

    @IBAction func promptButtonClicked(_ sender: UIButton) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "FoodSelectViewController") as! FoodSelectViewController
        self.present(nextViewController, animated:false, completion:nil)
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        introLabel.stopAnimation()
        showSpeechBubbleWorkItem?.perform()
        showSpeechBubbleWorkItem?.cancel()
        speechBubble.layer.removeAllAnimations()
        addMessageToSpeechBubbleWorkItem?.perform()
        addMessageToSpeechBubbleWorkItem?.cancel()
        showPromptButtonWorkItem?.perform()
        showPromptButtonWorkItem?.cancel()
    }

}
