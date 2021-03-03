//
//  ParkLunchViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 3/2/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class ParkLunchViewController: UIViewController {

    @IBOutlet weak var captionRect: UIImageView!

    @IBOutlet weak var captionLabel: AnimatedUILabel!

    @IBOutlet weak var characterImage: UIImageView!

    let captionText = "Let's start by having some lunch! Tap the screen to go to the snack shop."

    var showCaptionRectWorkItem: DispatchWorkItem?

    var delayedCaptionWorkItem: DispatchWorkItem?

    var chosenCharacter = "dog"

    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.image = UIImage(named: chosenCharacter)
        captionRect.translatesAutoresizingMaskIntoConstraints = true
        captionRect.isHidden = true
        showCaptionRect()
        delayedCaptionWorkItem = DispatchWorkItem {
            self.updateCaption(self.captionText)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: delayedCaptionWorkItem!)
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
    
    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        showCaptionRectWorkItem?.perform()
        showCaptionRectWorkItem?.cancel()
        delayedCaptionWorkItem?.perform()
        delayedCaptionWorkItem?.cancel()
        captionLabel.stopAnimation()
        captionRect.layer.removeAllAnimations()
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SnackShopViewController") as! SnackShopViewController
        nextViewController.chosenCharacter = chosenCharacter
        self.present(nextViewController, animated:false, completion:nil)
    }

}
