//
//  BackgroundSelect.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/23/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit

class BackgroundSelect: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!

    @IBOutlet weak var keyboardButton: UIButton!
    
    @IBOutlet weak var pongButton: UIButton!
    
    let answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    let answer4 = ["Ping pong", "Xylophone", "Basketball"]

    var promptButton = UIButton(type: UIButton.ButtonType.custom)
    
    var showPromptButtenWorkItem: DispatchWorkItem?

    var chooseButton = UIButton(type: UIButton.ButtonType.custom)
    
    @IBOutlet weak var anywhereButton: UIButton!

    func hideButtonQuestions() {
        questionLabel.isHidden = true
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        chooseButton.isHidden = true
        
    }
    
    func showButtonQuestions() {
        questionLabel.isHidden = false
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        label1.isHidden = false
        label2.isHidden = false
        label3.isHidden = false
        view.backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
        view.removeBackground()
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
            self.button1.transform = . identity
            self.button2.transform = . identity
            self.button3.transform = . identity
        })
    }

    // TODO: Currently not used yet
    func showChosenBackground() {
        if UserAnswers.background == "Amusement" {
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "School" {
            view.addBackground(imageName: School.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "Farm" {
            view.addBackground(imageName: Farm.imageName, contentMode: .scaleAspectFill)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.adjustsFontSizeToFitWidth = true
        
        button1.setImage(UIImage(named: "amParkButton"), for: .normal)
        button1.imageView?.contentMode = .scaleAspectFit
        
        button2.setImage(UIImage(named: "schoolButton"), for: .normal)
        button2.imageView?.contentMode = .scaleAspectFit
        
        button3.setImage(UIImage(named: "farmButton"), for: .normal)
        button3.imageView?.contentMode = .scaleAspectFit
        
        button1.setTitle(AmusementPark.answer, for: .normal)
        button2.setTitle(School.answer, for: .normal)
        button3.setTitle(Farm.answer, for: .normal)
        
        button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Clicked), for: .touchUpInside)
        
        keyboardButton.setImage(UIImage(named: "keyboard button"), for: .normal)
        pongButton.setTitle("Pong", for: .normal)
    }

    let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        UserAnswers.background = sender.title (for: .normal)!
        UserAnswers.character = sender.title (for: .normal)!
        UserAnswers.food = sender.title (for: .normal)!

        print(UserAnswers.background)
        print(UserAnswers.character)
        print(UserAnswers.food)
    }

    @IBAction func chooseButtonClicked(_ sender: UIButton) {
        revertAll()
        label1.backgroundColor = nil
        if UserAnswers.background == AmusementPark.answer {
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParkWelcomeViewController") as! ParkWelcomeViewController
            self.present(nextViewController, animated:false, completion:nil)
        }
    }

    @IBAction func button1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.button2.transform = .identity
            self.button3.transform = .identity
            self.button1.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        })
        
        showChooseButton()
    }
    
    @IBAction func button2Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.button1.transform = .identity
            self.button3.transform = .identity
            self.button2.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        })
        showChooseButton()
    }
    
    @IBAction func button3Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.button2.transform = .identity
            self.button1.transform = .identity
            self.button3.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        })
        
        showChooseButton()
    }
       
    @IBAction func userClickedAnywhere(_ sender: Any) {
        showPromptButtenWorkItem?.perform()
        showPromptButtenWorkItem?.cancel()
        revertAll()
        chooseButton.isHidden = true
    }
    
}

struct UserAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
}

struct AmusementPark {
    static let name = "Amusement Park"
    static let answer = "Amusement"
    static let imageName = "amusement2"
}

struct School {
    static let name = "School"
    static let answer = "School"
    static let imageName = "school"
}

struct Farm {
    static let name = "Farm"
    static let answer = "Farm"
    static let imageName = "farm"
}
