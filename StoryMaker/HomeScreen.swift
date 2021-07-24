//
//  HomeScreen.swift
//  StoryMaker
//
//  Created by Marina Lee on 6/13/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class HomeScreen: UIViewController {
    
    @IBOutlet weak var newStoryButton: UIButton!
    
    @IBOutlet weak var minigamesButton: UIButton!
    
   
    
    @IBAction func newStoryClicked(_ sender: UIButton) {
        animateButton(sender)
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
    
    func goToNextScreen() {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "BackgroundSelect") as! BackgroundSelect
               self.present(nextViewController, animated:false, completion:nil)
    }
}
