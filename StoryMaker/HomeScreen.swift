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
    
   
    
    @IBAction func newStoryClicked(_ sender: Any) {
        animateButton(button: newStoryButton)
    }
    
    func animateButton(button: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
         //   self.button2.transform = .identity
             button.transform =  CGAffineTransform(scaleX: 1.05, y: 1.05)

            self.minigamesButton.transform = CGAffineTransform(translationX: 0, y: 500)
            button.transform = CGAffineTransform(translationX: 0, y: 500)
            
        })
      //  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           // self.goToNextScreen()
       // }
    }
    
    func goToNextScreen() {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "BackgroundSelect") as! BackgroundSelect
               self.present(nextViewController, animated:false, completion:nil)
    }
}
