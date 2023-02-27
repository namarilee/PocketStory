//
//  PhotoboothSelect.swift
//  StoryMaker
//
//  Created by Marina Lee on 7/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PhotoboothSelect: UIViewController {
    let chooseButton = UIButton(type: UIButton.ButtonType.custom)
    
    @IBOutlet weak var boatButton: UIButton!
    
    @IBOutlet weak var campfireButton: UIButton!
    
    @IBOutlet weak var beachButton: UIButton!
    
     override func viewDidLoad() {
            super.viewDidLoad()
            view.layoutIfNeeded()
            chooseButton.isHidden = true
            boatButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
            boatButton.translatesAutoresizingMaskIntoConstraints = true
            campfireButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
            campfireButton.translatesAutoresizingMaskIntoConstraints = true
            beachButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
            beachButton.translatesAutoresizingMaskIntoConstraints = true
        }
    
    
    @IBAction func boatButtonClicked(_ sender: Any) {
        UserAnswers.photo = "boat"
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                  
                  self.campfireButton.transform = .identity
                  self.beachButton.transform = .identity
                  self.boatButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
              })
              showChooseButton()
    }
    
    
    
    @IBAction func campfireButtonClicked(_ sender: Any) {
        UserAnswers.photo = "Nightscene"

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                  
                  self.beachButton.transform = .identity
                  self.boatButton.transform = .identity
                  self.campfireButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
              })
              
              showChooseButton()
    }
    
    
    @IBAction func beachButtonClicked(_ sender: Any) {
        UserAnswers.photo = "beach"
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                self.boatButton.transform = .identity
                self.campfireButton.transform = .identity
                self.beachButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            
            showChooseButton()
    }
    func showChooseButton() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "selectButton")
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseButton.heightAnchor.constraint(equalTo: chooseButton.widthAnchor, multiplier: 51.0/190.0),
            chooseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NSLayoutConstraint(item: chooseButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.73, constant: 0)
        ])

        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
    }
    
   
    func revertAll() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.boatButton.transform = . identity
            self.campfireButton.transform = . identity
            self.beachButton.transform = . identity
        })
    }
    
    @IBAction func chooseButtonClicked(_ sender: UIButton) {
           revertAll()
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoboothPicture") as! PhotoboothPicture
               self.present(nextViewController, animated:false, completion:nil)
       }
    
    
    @IBAction func userClickedAnywhere(_ sender: Any) {
        chooseButton.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                 
                 self.boatButton.transform = .identity
                 self.campfireButton.transform = .identity
                 self.beachButton.transform = .identity
             })
    }
    

}

struct BoatRiver {
    static let answer = "Boat river"
}
struct Campfire {
    static let answer = "Campfire"
}
struct Beach {
    static let answer = "Beach"
}
