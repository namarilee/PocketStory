//
//  SnackShopViewController.swift
//  StoryMaker
//
//  Created by MarinaM Lee on 3/2/21.
//  Copyright © 2021 marinalee. All rights reserved.
//
import AVFoundation
import Foundation
import UIKit

class SnackShopViewController: UIViewController {

    @IBOutlet weak var captionLabel: AnimatedUILabel!

    @IBOutlet weak var goButton: UIButton!

    @IBOutlet weak var characterImage: UIImageView!
    var player: AVAudioPlayer!
    var musicPlaying = false
    let captionText = "Let's order some food!"

    var showGoButtenWorkItem: DispatchWorkItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.image = UIImage(named: UserAnswers.character)
        updateCaption(captionText)
        showGoButton(delay: 2)
    }
    
    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }

    func showGoButton(delay: Double) {
        goButton.isHidden = true
        goButton.transform = .identity

        showGoButtenWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.goButton)
            self.goButton.isHidden = false
            self.goButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.goButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showGoButtenWorkItem!)
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
    }

    @IBAction func goButtonClicked(_ sender: UIButton) {
        musicPlaying = true
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "BambooDialogViewController") as! BambooDialogViewController
        self.present(nextViewController, animated:false, completion:nil)
       // BackgroundSelect().chooseButtonClicked(<#UIButton#>).stopSound()
//        var url = Bundle.main.url(forResource: "foodcourtost", withExtension: "mp3")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player?.prepareToPlay()
//        player?.play()
       // BackgroundSelect().player?.stop()
    //    BackgroundSelect().stopSound(soundFile: "dixielandost (1)")

        BackgroundSelect().playSound(soundFile: "foodcourtost")
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        showGoButtenWorkItem?.perform()
        showGoButtenWorkItem?.cancel()
        captionLabel.stopAnimation()
    }

}
