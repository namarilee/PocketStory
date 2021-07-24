//
//  PhotoboothPicture.swift
//  StoryMaker
//
//  Created by Marina Lee on 7/24/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PhotoboothPicture: UIViewController {
    
    
    @IBOutlet weak var characterImage: UIButton!
    
    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    @IBOutlet weak var photoBG: UIImageView!
    var showCaptionRectWorkItem: DispatchWorkItem?

    var delayedCaptionWorkItem: DispatchWorkItem?
    
    @IBOutlet weak var captionRect: UIImageView!
    
    @IBOutlet weak var captionLabel: AnimatedUILabel!
    let captionText = "Drag the character to move it anywhere!"
    let charImage = UIImage(named: UserAnswers.character)


    override func viewDidLoad() {
        super.viewDidLoad()
        photoBG.image = UIImage(named: UserAnswers.photo)
        characterImage.setImage(charImage, for: .normal)
        characterImage.isUserInteractionEnabled = true
        characterImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(PhotoboothPicture.moveCharacter(_:))))
        captionRect.translatesAutoresizingMaskIntoConstraints = true
        captionRect.isHidden = true
        captionLabel.isHidden = true

        showCaptionRect()
       addMessageToSpeechBubble("Drag the character to move it anywhere!")
    }
    
    func addMessageToSpeechBubble(_ message: String) {
        captionLabel.isHidden = false
           captionLabel.text = message
           addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
               self.captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: addMessageToSpeechBubbleWorkItem!)
       }
    
    func updateCaption(_ caption: String) {
          captionLabel.stopAnimation()
          captionLabel.text = caption
          captionLabel.adjustsFontSizeToFitWidth = true
          captionLabel.numberOfLines = 0
          captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
      }
    
    
    @IBAction func characterClicked(_ sender: UIButton) {
        animateButton(sender)
    }
    
    
    @IBAction func userClickedAnywhere(_ sender: Any) {
               showCaptionRectWorkItem?.cancel()
               delayedCaptionWorkItem?.perform()
               delayedCaptionWorkItem?.cancel()
               captionLabel.stopAnimation()
               captionRect.layer.removeAllAnimations()
        captionRect.isHidden = true
        captionLabel.isHidden = true
    }
    
    @objc func moveCharacter(_ recognizer: UIPanGestureRecognizer) {
          let translation: CGPoint = recognizer.translation(in: self.view)
          recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
          recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
      }
    
    func animateButton(_ buttonToAnimate: UIView) {
          UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                   buttonToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
               }) { (_) in
                   UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                       buttonToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                   }, completion: nil)
               }
      }
    
    func showCaptionRect() {
        showCaptionRectWorkItem = DispatchWorkItem {
            self.captionRect.isHidden = false
            self.captionRect.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.captionRect.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: showCaptionRectWorkItem!)
    }

}
