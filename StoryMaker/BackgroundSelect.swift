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

    var speechBubble = UIImageView()

    let speechBubbleButtonFrame = CGRect(x: 620, y: 330, width: 72, height: 54)

    var showSpeechBubbleWorkItem: DispatchWorkItem?

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    var chooseButton = UIButton(type: UIButton.ButtonType.custom)
    
    var playMyStoryButton = UIButton(type: UIButton.ButtonType.custom)
    
    var captionRect = UIImageView(frame: CGRect(x: 250, y: 20, width: 416.5, height: 100))
    
    let captionButtonFrame = CGRect(x: 620, y: 100, width: 90, height: 54)
    
    var captionLabel = AnimatedUILabel(frame: CGRect(x: 175, y: -30, width: 580, height: 200))

    var delayedCaptionWorkItem: DispatchWorkItem?

    var storyTitle = UILabel(frame: CGRect(x: 210, y: 125, width: 497, height: 165))
    
    var chosenCharacter =  UIImageView(frame: CGRect(x: 340, y: 240, width: 100, height: 150))
    
    var chosenFood =  UIImageView(frame: CGRect(x: 340, y: 240, width: 100, height: 150))
    
    var dogHappy = UIImageView(frame: CGRect(x: 125, y: 260, width: 92, height: 136.36))
    
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
    
    func showCharacter() {
        self.view.addSubview(character)
        character.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            character.heightAnchor.constraint(equalTo: character.widthAnchor, multiplier: 150.0/100.0),
            character.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            NSLayoutConstraint(item: character, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 0.51, constant: 0),
            NSLayoutConstraint(item: character, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 2.5, constant: 0)
        ])
        character.image = UIImage(named: "dog")
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.character.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.35))
        })
    }

    func showSpeechBubble() {
        speechBubble.isHidden = true
        view.addSubview(self.speechBubble)
        speechBubble.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            speechBubble.heightAnchor.constraint(equalTo: speechBubble.widthAnchor, multiplier: 300.0/500.0),
            speechBubble.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            NSLayoutConstraint(item: speechBubble, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.06, constant: 0),
            NSLayoutConstraint(item: speechBubble, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.85, constant: 0)
        ])
        speechBubble.image = UIImage(named: "speechBubble")
        showSpeechBubbleWorkItem = DispatchWorkItem {
            self.speechBubble.isHidden = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: showSpeechBubbleWorkItem!)
    }

    func addMessageToSpeechBubble(_ message: String) {
        introLabel.isHidden = false
        introLabel.numberOfLines = 0
        introLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 18)
        introLabel.text = message
        view.addSubview(self.introLabel)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            introLabel.heightAnchor.constraint(equalTo: introLabel.widthAnchor, multiplier: 21.0/500.0),
            introLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            NSLayoutConstraint(item: introLabel, attribute: .centerX, relatedBy: .equal, toItem: speechBubble, attribute: .centerX, multiplier: 1.4, constant: 0),
            NSLayoutConstraint(item: introLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.45, constant: 0)
        ])
        addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: addMessageToSpeechBubbleWorkItem!)
    }
    
    func hideIntro() {
        character.isHidden = true
        speechBubble.isHidden = true
        promptButton.isHidden = true
        self.introLabel.removeFromSuperview()
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
    
    func goToCharacterSelect() {
        view.removeBackground()
        questionLabel.text = questions[1]
        label1.text = imageLabels[1][0]
        label1.adjustsFontSizeToFitWidth = true
        button1.setTitle(answers[1][0], for: .normal)
        label2.text = imageLabels[1][1]
        label2.adjustsFontSizeToFitWidth = true
        button2.setTitle(answers[1][1], for: .normal)
        label3.text = imageLabels[1][2]
        label3.adjustsFontSizeToFitWidth = true
        button3.setTitle(answers[1][2], for: .normal)
        button1.setImage(UIImage(named: "dog"), for: .normal)
        button1.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button2.setImage(UIImage(named: "cat"), for: .normal)
        button2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button3.setImage(UIImage(named: "cow"), for: .normal)
        button3.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
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
    
    func showChosenCharacter() {
        if UserAnswers.character == "dog" {
            chosenCharacter.image = UIImage(named: "dog")
            self.view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cat" {
            chosenCharacter.image = UIImage(named: "cat")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            self.view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cow" {
            chosenCharacter.image = UIImage(named: "cow")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            self.view.addSubview(chosenCharacter)
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
    
    func characterAnimation() {
        showChosenCharacter()
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 0, y: -200)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.chosenCharacter.isHidden = true
            self.dogHappy.image = UIImage(named: "dogHappy")
            self.view.addSubview(self.dogHappy)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.repeat, .autoreverse], animations: {
                self.dogHappy.transform = CGAffineTransform(translationX: 0, y: -10)
            })
            UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.dogHappy.alpha = 0
            })
        }
    }
    
    func dogWalkLeft() {
        chosenCharacter.image = UIImage(named: "dog")
        self.view.addSubview(chosenCharacter)
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 100, y: -10)
        })
    }

    func showPromptButton(image: UIImage, frame: CGRect, delay: Double, animation: Int) {
        promptButton.isHidden = true
        promptButton.transform = .identity
        promptButton.setImage(image, for: .normal)
//        promptButton.frame = frame
        
        showPromptButtenWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.promptButton)
            self.promptButton.isHidden = false
            switch animation {
            case 0:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                })
            case 1:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(translationX: 0, y: 200)
                })
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(translationX: 0, y: 100)
                    self.promptButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                })
            case 2:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                })
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            default:
                break;
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showPromptButtenWorkItem!)
        promptButton.addTarget(self, action: #selector(promptButtonClicked), for: .touchUpInside)
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
            hideButtonQuestions()
            //    view.addBackground(imageName: amusementPark.imageName, contentMode: .scaleAspectFill)
            showChosenBackground()
            
            showCharacter()
            
            showSpeechBubble()
            
            addMessageToSpeechBubble("Welcome to the " + AmusementPark.name + "!")
            
            promptButton.isHidden = true
            view.addSubview(promptButton)
            promptButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                promptButton.heightAnchor.constraint(equalTo: promptButton.widthAnchor, multiplier: 54.0/72.0),
                promptButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
                NSLayoutConstraint(item: promptButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.47, constant: 0),
                NSLayoutConstraint(item: promptButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.7, constant: 0)
            ])
            showPromptButton(image: UIImage(named: "hello")!, frame: speechBubbleButtonFrame, delay: 7, animation: 0)
        }
        
        if UserAnswers.character == "dog" || UserAnswers.character == "cat" || UserAnswers.character == "cow" {
            hideButtonQuestions()
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
            showChosenCharacter()
            showCaptionRect()
            captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
            delayedCaptionWorkItem = DispatchWorkItem {
                self.view.addSubview(self.captionLabel)
                self.captionLabel.numberOfLines = 0
                self.updateCaption("Let's start by having some lunch! Tap the screen to go to the snack shop.")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: delayedCaptionWorkItem!)
        }

        pongButton.isHidden = true
        hideButtonQuestions()
    }
    
    @IBAction func promptButtonClicked(_ sender: UIButton) {
        count += 1
        print("COUNT: \(count)")
        
        if self.count == 1 {
            self.introLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 18)
            self.introLabel.text = "Let's choose a character!"
            self.view.addSubview(self.introLabel)
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
            
            showPromptButton(image: UIImage(named: "Next button")!, frame: speechBubbleButtonFrame, delay: 3, animation: 1)
        }

        if self.count == 2 {
            self.promptButton.removeTarget(self, action: #selector(self.promptButtonClicked), for: .touchUpInside)
            self.hideIntro()
            self.showButtonQuestions()
            self.goToCharacterSelect()
            let playImage = UIImage(named: "play my story button")
            playMyStoryButton.frame = CGRect(x: 500, y: 150, width: 240, height: 180)
            playMyStoryButton.setImage(playImage, for: .normal)
            //  self.view.addSubview(self.playMyStoryButton)
            playMyStoryButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        }
        
        if self.count == 3 {
            let nextViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BambooDialogViewController") as! BambooDialogViewController
            self.present(nextViewController, animated:false, completion:nil)
        }
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        characterAnimation()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        self.hideButtonQuestions()
        self.playMyStoryButton.isHidden = true
        storyTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 40)
        storyTitle.textAlignment = .center
        view.addSubview(storyTitle)
        showStoryTitle(Pup.name + "'s Amazing Day at the " + AmusementPark.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dogWalkLeft()
            self.storyTitle.isHidden = true
            self.view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
            self.showCaptionRect()
            self.captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
            self.view.addSubview(self.captionLabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.updateCaption(Pup.name + " had an amazing day at the " + AmusementPark.name + "!")
            }
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
        showSpeechBubbleWorkItem?.perform()
        showSpeechBubbleWorkItem?.cancel()
        speechBubble.layer.removeAllAnimations()
        addMessageToSpeechBubbleWorkItem?.perform()
        addMessageToSpeechBubbleWorkItem?.cancel()
        introLabel.stopAnimation()
        showPromptButtenWorkItem?.perform()
        showPromptButtenWorkItem?.cancel()
        captionRect.layer.removeAllAnimations()
        captionLabel.stopAnimation()
        delayedCaptionWorkItem?.perform()
        delayedCaptionWorkItem?.cancel()
        revertAll()
        let captionText = "Let's order some food!"
        if row == 2 && captionLabel.text != captionText {
            view.addBackground(imageName: "snackShop", contentMode: .scaleAspectFill)
            updateCaption(captionText)
            showPromptButton(image: UIImage(named: "go button")!, frame: captionButtonFrame, delay: 2, animation: 2)
        }
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
