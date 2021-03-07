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

    let answer0 = [
        "Amusement",
        "School",
        "Farm"]
    
    let answer1 = [ "dog", "cat",  "cow"]
    
    let answer2 = ["pizza", "Hotdog", "Popcorn"]
    
    let answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    let answer4 = ["Ping pong", "Xylophone", "Basketball"]
    
    let answers = [
        ["Amusement", "School", "Farm"],
        ["dog",  "cat",  "cow"],
        ["pizza", "Hotdog", "Popcorn"],
        ["Ping pong", "Xylophone", "Basketball"]
    ]
    
    let questions =
        ["Where would you like your story to be?",
         "Let's start building your story! Choose a character.",
         "Choose a food item!",
         "Choose a food item!",
         "What would you like to play?"]
    
    let imageLabels = [
        ["Amusement Park", "School", "Farm"],
        ["Pup", "Whiskers", "Bessie"],
        ["Pizza", "Hotdog", "Popcorn"]
    ]
    
    var row = 0
    
    var introLabel = AnimatedUILabel(frame: CGRect())
    
    var promptButton = UIButton(type: UIButton.ButtonType.custom)
    
    var showPromptButtenWorkItem: DispatchWorkItem?
    
    var character =  UIImageView()

    var chooseButton = UIButton(type: UIButton.ButtonType.custom)
    
    var captionRect = UIImageView(frame: CGRect(x: 250, y: 20, width: 416.5, height: 100))
    
    let captionButtonFrame = CGRect(x: 620, y: 100, width: 90, height: 54)
    
    var captionLabel = AnimatedUILabel(frame: CGRect(x: 175, y: -30, width: 580, height: 200))

    var delayedCaptionWorkItem: DispatchWorkItem?

    var storyTitle = UILabel(frame: CGRect(x: 210, y: 125, width: 497, height: 165))
    
    var chosenFood =  UIImageView(frame: CGRect(x: 340, y: 240, width: 100, height: 150))
    
    @IBOutlet weak var anywhereButton: UIButton!
    
    var count = 0
    
    var currentAnimation = 0
    
    func hideButtonQuestions() {
        questionLabel.isHidden = true
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        introLabel.isHidden = true
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
        introLabel.isHidden = false
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

    func showCaptionRect() {
        captionRect.image = UIImage(named: "captionRect")
        self.view.addSubview(self.captionRect)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
            self.captionRect.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }
    
    func revertAll() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.button1.transform = . identity
            self.button2.transform = . identity
            self.button3.transform = . identity
        })
    }
    
    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }
    
    func showStoryTitle(_ title: String) {
        storyTitle.text = title
        storyTitle.adjustsFontSizeToFitWidth = true
        storyTitle.numberOfLines = 0
    }

    func showChosenBackground() {
        if UserAnswers.background == "Amusement" {
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "School" {
            view.addBackground(imageName: School.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "Farm" {
            view.addBackground(imageName: Farm.imageName, contentMode: .scaleAspectFill)
        }
    }
    
    func showChosenFood() {
          if UserAnswers.food == "pizza" {
              chosenFood.image = UIImage(named: "pizza")
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == "hotdog" {
              chosenFood.image = UIImage(named: "hotdog")
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == "popcorn" {
              chosenFood.image = UIImage(named: "popcorn")
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          }
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        button1.setImage(UIImage(named: "amParkButton"), for: .normal)
        
        button1.imageView?.contentMode = .scaleAspectFit
        
        button2.setImage(UIImage(named: "schoolButton"), for: .normal)
        button2.imageView?.contentMode = .scaleAspectFit
        
        button3.setImage(UIImage(named: "farmButton"), for: .normal)
        button3.imageView?.contentMode = .scaleAspectFit
        
        button1.setTitle(answers[row][0], for: .normal)
        button2.setTitle(answers[row][1], for: .normal)
        button3.setTitle(answers[row][2], for: .normal)
        
        button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Clicked), for: .touchUpInside)
        
        keyboardButton.setImage(UIImage(named: "keyboard button"), for: .normal)
        pongButton.setTitle("Pong", for: .normal)
    }

    let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        questionLabel.text = questions[row]

        UserAnswers.background = sender.title (for: .normal)!
        UserAnswers.character = sender.title (for: .normal)!
        UserAnswers.food = sender.title (for: .normal)!

        print(UserAnswers.background)
        print(UserAnswers.character)
        print(UserAnswers.food)
    }

    @IBAction func chooseButtonClicked(_ sender: UIButton) {
        row += 1
        print("ROW: \(row)")
        revertAll()
        label1.backgroundColor = nil
        if UserAnswers.background == "Amusement" {
            let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParkWelcomeViewController") as! ParkWelcomeViewController
            self.present(nextViewController, animated:false, completion:nil)
        }
    }

    @IBAction func button1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            switch self.currentAnimation {
            case 0:
                self.button2.transform = .identity
                self.button3.transform = .identity
                self.button1.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        
        showChooseButton()
    }
    
    @IBAction func button2Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                self.button1.transform = .identity
                self.button3.transform = .identity
                self.button2.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        showChooseButton()
    }
    
    @IBAction func button3Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            switch self.currentAnimation {
            case 0:
                self.button2.transform = .identity
                self.button1.transform = .identity
                self.button3.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        
        showChooseButton()
    }
       
    @IBAction func userClickedAnywhere(_ sender: Any) {
        print("User Clicked Anywhere ROW: \(row)")
        character.layer.removeAllAnimations()
        introLabel.stopAnimation()
        showPromptButtenWorkItem?.perform()
        showPromptButtenWorkItem?.cancel()
        captionRect.layer.removeAllAnimations()
        captionLabel.stopAnimation()
        delayedCaptionWorkItem?.perform()
        delayedCaptionWorkItem?.cancel()
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
    static var name = "Amusement Park"
    static var imageName = "amusement2"
    
}

struct School {
    static var name = "School"
    static var imageName = "school"
}

struct Farm {
    static var name = "Farm"
    static var imageName = "farm"
}

struct Pup {
    static var name = "Pup"
    static var imageName = "dog"
}

struct Whiskers {
    static var name = "Whiskers"
    static var imageName = "cat"
}

struct Bessie {
    static var name = "Bessie"
    static var imageName = "cow"
}
