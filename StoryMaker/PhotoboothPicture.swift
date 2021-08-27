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

    @IBOutlet weak var captureButton: UIButton!

    @IBOutlet weak var characterImageButton: UIButton!

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    @IBOutlet weak var rightArrow: UIImageView!

    @IBOutlet weak var photoBG: UIImageView!

    var showCaptionRectWorkItem: DispatchWorkItem?

    var delayedCaptionWorkItem: DispatchWorkItem?

    @IBOutlet weak var downArrow: UIImageView!

    @IBOutlet weak var captionRect: UIImageView!

    @IBOutlet weak var anywhereButton: UIButton!

    @IBOutlet weak var captionLabel: AnimatedUILabel!

    let captionText = "Drag the character to move it anywhere!"

    let charImage = UIImage(named: UserAnswers.character)

    @IBOutlet weak var picSuccessNotif: UIImageView!

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var okButton: UIButton!

    var showGoButtenWorkItem: DispatchWorkItem?

    var hasShownNextCaptionMessage = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        nextButton.isHidden = true
        captureButton.isHidden = true
        anywhereButton.isHidden = true
        picSuccessNotif.isHidden = true
        okButton.isHidden = true
        rightArrow.isHidden = true
        downArrow.isHidden = true
        
        photoBG.image = UIImage(named: UserAnswers.photo)
        characterImageButton.setImage(charImage, for: .normal)
        characterImageButton.isUserInteractionEnabled = true
        characterImageButton.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(PhotoboothPicture.moveCharacter(_:))))
        captionRect.translatesAutoresizingMaskIntoConstraints = true
        captionRect.isHidden = true
        captionLabel.isHidden = true
        
        showCaptionRect()
        delayedCaptionWorkItem = DispatchWorkItem {
            self.addMessageToSpeechBubble("Drag the character to move it anywhere!")
        }

        self.rightArrow.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
            UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                self.rightArrow.transform = CGAffineTransform(translationX: -10, y: 0)
            }, completion: nil)
            
            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [self] in
                self.rightArrow.transform = CGAffineTransform(translationX: 10, y: 0)
            }, completion: nil)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: delayedCaptionWorkItem!)
        //        showNextButton(delay: 4)
    }

    func addMessageToSpeechBubble(_ message: String) {
        captionLabel.isHidden = false
        captionLabel.text = message
        addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
            self.captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.05)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: addMessageToSpeechBubbleWorkItem!)
    }

    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }

    // Not used
    @IBAction func characterClicked(_ sender: UIButton) {
        animateButton(sender)
    }

    var count = 0

    // Not used
    @IBAction func goButtonClicked(_ sender: UIButton) {
        count += 1
        if count == 1 {
            delayedCaptionWorkItem = DispatchWorkItem {
                self.addMessageToSpeechBubble("Tap the camera button once you're ready to take a picture!")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: delayedCaptionWorkItem!)
            captureButton.isHidden = false
            downArrow.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
                UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                    self.downArrow.transform = CGAffineTransform(translationX: 0, y: -10)
                }, completion: nil)

                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [self] in
                    self.downArrow.transform = CGAffineTransform(translationX: 0, y: 10)
                }, completion: nil)
            }
        }

        if count == 2 {
            captionRect.isHidden = true
            nextButton.isHidden = true
            captionLabel.isHidden = true
        }
    }

    @objc func moveCharacter(_ recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)

        rightArrow.isHidden = true
        if (!hasShownNextCaptionMessage) {
            hasShownNextCaptionMessage = true
            delayedCaptionWorkItem?.cancel()
            addMessageToSpeechBubbleWorkItem?.cancel()
            captionLabel.stopAnimation()
            delayedCaptionWorkItem = DispatchWorkItem {
                self.addMessageToSpeechBubble("Tap the camera button once you're ready to take a picture!")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: delayedCaptionWorkItem!)
            captureButton.isHidden = false
            downArrow.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
                UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                    self.downArrow.transform = CGAffineTransform(translationX: 0, y: -5)
                }, completion: nil)
                
                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [self] in
                    self.downArrow.transform = CGAffineTransform(translationX: 0, y: 5)
                }, completion: nil)
            }
        }
    }

    // Not used
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

    // Not used
    func showNextButton(delay: Double) {
        nextButton.isHidden = true
        nextButton.transform = .identity
        
        showGoButtenWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.nextButton)
            self.nextButton.isHidden = false
            self.nextButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showGoButtenWorkItem!)
        nextButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
    }

    @IBAction func captureButtonClicked(_ sender: Any) {
        captureButton.isHidden = true
        downArrow.isHidden = true
        captionRect.isHidden = true
        captionLabel.isHidden = true
        var image :UIImage?
        let currentLayer = UIApplication.shared.keyWindow!.layer
        let currentScale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale);
        guard let currentContext = UIGraphicsGetCurrentContext() else {return}
        currentLayer.render(in: currentContext)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let img = image else { return }
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.characterImageButton.isHidden = true
            self.anywhereButton.isHidden = false
            self.picSuccessNotif.isHidden = false
            self.okButton.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.picSuccessNotif.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.okButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
        }
    }

    @IBAction func okButtonTapped(_ sender: Any) {
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "dixielandost (1)")
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParkOutro") as! ParkOutro
        self.present(nextViewController, animated:false, completion:nil)
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        addMessageToSpeechBubbleWorkItem?.perform()
        addMessageToSpeechBubbleWorkItem?.cancel()
        delayedCaptionWorkItem?.perform()
        delayedCaptionWorkItem?.cancel()
        showCaptionRectWorkItem?.perform()
        showCaptionRectWorkItem?.cancel()
        showGoButtenWorkItem?.perform()
        showGoButtenWorkItem?.cancel()
    }
}
