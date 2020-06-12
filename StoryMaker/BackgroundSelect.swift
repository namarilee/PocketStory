//
//  BackgroundSelect.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/23/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit

extension UILabel {
    
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
    
}

class BackgroundSelect: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var Label3: UILabel!
    var answer0 = [
        "Amusement",
        "School",
        "Farm"] as [Any]
    
    var answer1 = [ "dog", "cat",  "cow"] as [Any]
    
    var answer2 = [UIImage(imageLiteralResourceName: "pizza"), "Hotdog", "Popcorn"] as [Any]
    
    var answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    var answer4 = ["Ping pong", "Xylophone", "Basketball"]
    
    var answers = [
         ["Amusement", "School", "Farm"],
        ["dog",  "cat",  "cow"],
        [UIImage(imageLiteralResourceName: "pizza"), "Hotdog", "Popcorn"],
        ["Merry-go-round", "Rollercoaster", "Ferris wheel"],
        ["Ping pong", "Xylophone", "Basketball"]
    ]
    
    var questions =
        ["Where would you like your story to be?",
         "Let's start building your story! Choose a character",
         "Choose a food item!",
         "Let's go on a ride!",
         "What would you like to play?"]
    
    var imageLabels = [
    ["Amusement Park", "School", "Farm"],
    ["Pup", "Whiskers", "Bessie"]
    ]
    
    var row = 0
    
    var introLabel = UILabel(frame: CGRect(x: 320, y: 290, width: 500, height: 21))

    var helloButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
    
    var character =  UIImageView(frame: CGRect(x: 180, y: 450, width: 100, height: 150))
    
    var speechBubble = UIImageView(frame: CGRect(x: 220, y: 240, width: 500, height: 300))
    
    var chooseButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
    
    var playMyStoryButton = UIButton(type: UIButton.ButtonType.custom) as UIButton

    var captionRect = UIImageView(frame: CGRect(x: 170, y: 20, width: 416.5, height: 72.5))
    
    var captionLabel = UILabel(frame: CGRect(x: 100, y: -35, width: 600, height: 200))
    
    var storyTitle = UILabel(frame: CGRect(x: 210, y: 125, width: 497, height: 165))
    
    var chosenCharacter =  UIImageView(frame: CGRect(x: 120, y: 450, width: 100, height: 150))

    var dogHappy = UIImageView(frame: CGRect(x: 125, y: 260, width: 92, height: 136.36))
    
  //  var anywhereButton = UIButton(frame: CGRect(x: 0, y: 0, width: 900, height: 500))
    
    @IBOutlet weak var anywhereButton: UIButton!
    var count = 0
    
    var currentAnimation = 0
    
    func hideButtonQuestions() {
        questionLabel.isHidden = true
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        introLabel.isHidden = true
        Label1.isHidden = true
        Label2.isHidden = true
        Label3.isHidden = true
        chooseButton.isHidden = true

    }

    func showButtonQuestions() {
        questionLabel.isHidden = false
        Button1.isHidden = false
        Button2.isHidden = false
        Button3.isHidden = false
        introLabel.isHidden = false
        Label1.isHidden = false
        Label2.isHidden = false
        Label3.isHidden = false
    }

    func showCharacter() {
        character.image = UIImage(named: "dog")
        self.view.addSubview(character)
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.character.transform = CGAffineTransform(translationX: 0, y: -150)
        })
    }
    
    func showSpeechBubble() {
        speechBubble.image = UIImage(named: "speechBubble")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view.addSubview(self.speechBubble)
      
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
    }
    
    func addMessageToSpeechBubble(_ message: String) {
        self.introLabel.isHidden = false
        self.introLabel.font = UIFont(name: "Rockwell", size: 18)
        self.introLabel.text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.view.addSubview(self.introLabel)
            self.introLabel.animate(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
    }
    
    func hideIntro() {
        character.isHidden = true
        speechBubble.isHidden = true
        helloButton.isHidden = true
        self.introLabel.removeFromSuperview()
    }
    
    func showChooseButton1() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "choose button")
            chooseButton.frame = CGRect(x: 130, y: 220, width: 162, height: 121.5)
        
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
       
    }
    
    func showChooseButton2() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "choose button")
            chooseButton.frame = CGRect(x: 370, y: 220, width: 162, height: 121.5)
        
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)

    }
    
    func showChooseButton3() {
           chooseButton.isHidden = false
           let chooseImage = UIImage(named: "choose button")
               chooseButton.frame = CGRect(x: 610, y: 220, width: 162, height: 121.5)
           
           chooseButton.setImage(chooseImage, for: .normal)
           self.view.addSubview(self.chooseButton)
           chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
       

       }
    
    func goToCharacterSelect() {
        view.removeBackground()
        questionLabel.text = questions[1]
        Label1.text = imageLabels[1][0]
        Label1.adjustsFontSizeToFitWidth = true
        Button1.setTitle(answers[1][0] as? String, for: .normal)
        Label2.text = imageLabels[1][1]
        Label2.adjustsFontSizeToFitWidth = true
        Button2.setTitle(answers[1][1] as? String, for: .normal)
        Label3.text = imageLabels[1][2]
        Label3.adjustsFontSizeToFitWidth = true
        Button3.setTitle(answers[1][2] as? String, for: .normal)
        Button1.setImage(UIImage(named: "dog"), for: .normal)
        Button1.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        Button2.setImage(UIImage(named: "cat"), for: .normal)
        Button2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        Button3.setImage(UIImage(named: "cow"), for: .normal)
        Button3.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
      
    }
    
    func showCaptionRect() {
        captionRect.image = UIImage(named: "captionRect")
        self.view.addSubview(self.captionRect)
      UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
            self.captionRect.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
           })
               
    }
    
    func updateCaption(_ caption: String) {
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
    }
    
    func showStoryTitle(_ title: String) {
        storyTitle.text = title
        storyTitle.adjustsFontSizeToFitWidth = true
        storyTitle.numberOfLines = 0
    }
    
    func characterAnimation() {
        chosenCharacter.image = UIImage(named: "dog")
        self.view.addSubview(chosenCharacter)
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
                
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        Button1.setImage(UIImage(named: "amusement2"), for: .normal)
        
        Button1.imageView?.contentMode = .scaleAspectFit
        
        Button2.setImage(UIImage(named: "school"), for: .normal)
        Button2.imageView?.contentMode = .scaleAspectFit
        
        Button3.setImage(UIImage(named: "farm"), for: .normal)
        Button3.imageView?.contentMode = .scaleAspectFit
        
        Button1.setTitle(answers[row][0] as? String, for: .normal)
        Button2.setTitle(answers[row][1] as? String, for: .normal)
        Button3.setTitle(answers[row][2] as? String, for: .normal)
        
        Button1.addTarget(self, action: #selector(Button1Clicked), for: .touchUpInside)
        Button2.addTarget(self, action: #selector(Button2Clicked), for: .touchUpInside)
        Button3.addTarget(self, action: #selector(Button3Clicked), for: .touchUpInside)
        
      /*  anywhereButton.backgroundColor = .blue
        self.view.addSubview(self.anywhereButton)
        anywhereButton.addTarget(self, action: #selector(userClickedAnywhere), for: .touchUpInside)*/
       
    }
    
    let Mainstory : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        
        
        questionLabel.text = questions[row]
       
        userAnswers.background = sender.title (for: .normal)!
        
        userAnswers.character = sender.title (for: .normal)!
        
        userAnswers.food = sender.title (for: .normal)!
        
        print(userAnswers.background)
        print(userAnswers.character)

      /*  if userAnswers.character == "dog" {
            showChooseButton1()
            print("character")
        }*/
        
    }
    
    @IBAction func chooseButtonClicked(_ sender: UIButton) {
             row += 1
             print(row)
        Label1.backgroundColor = nil
        if userAnswers.background == "Amusement" {
            hideButtonQuestions()
            view.addBackground(imageName: amusementPark.imageName, contentMode: .scaleAspectFill)
            
            showCharacter()
                     
            showSpeechBubble()
                 
            addMessageToSpeechBubble("Welcome to the " + amusementPark.name + "!")
                     

            let helloImage = UIImage(named: "hello")
                     
            helloButton.frame = CGRect(x: 620, y: 330, width: 72, height: 54)
            helloButton.setImage(helloImage, for: .normal)
                 
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.view.addSubview(self.helloButton)
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                         
                self.helloButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                         
                         
                     })
                 }
                     helloButton.addTarget(self, action: #selector(helloButtonClicked), for: .touchUpInside)
                     
                   

                 }
   /*     if sender == Button1 && row == 1 {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                                
            self.Button1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
              print("dog clicked")
                            })
        }*/
        }
        
    @IBAction func helloButtonClicked(_ sender: UIButton) {
            count += 1
            print(count)
        
        if self.count == 1 {
            
            self.introLabel.font = UIFont(name: "Rockwell", size: 18)
            helloButton.isHidden = true
            self.introLabel.text = "Let's choose a character!"
            self.view.addSubview(self.introLabel)
            self.introLabel.animate(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
                self.helloButton.isHidden = false
                let helloImage = UIImage(named: "Next button")
                self.helloButton.setImage(helloImage, for: .normal)
            }
        
        }
           if self.count == 2 {
                self.helloButton.removeTarget(self, action: #selector(self.helloButtonClicked), for: .touchUpInside)
                self.hideIntro()
                self.showButtonQuestions()
                self.goToCharacterSelect()
            let playImage = UIImage(named: "play my story button")
                        playMyStoryButton.frame = CGRect(x: 500, y: 150, width: 240, height: 180)
                        playMyStoryButton.setImage(playImage, for: .normal)
                        self.view.addSubview(self.playMyStoryButton)
                        playMyStoryButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
            }
            
        
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        characterAnimation()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        self.hideButtonQuestions()
        self.playMyStoryButton.isHidden = true
        storyTitle.font = UIFont(name: "Rockwell-Bold", size: 40)
        storyTitle.textAlignment = .center
        view.addSubview(storyTitle)
        showStoryTitle(Pup.name + "'s Amazing Day at the " + amusementPark.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dogWalkLeft()
            self.storyTitle.isHidden = true
            self.view.addBackground(imageName: amusementPark.imageName, contentMode: .scaleAspectFill)
            self.showCaptionRect()
        self.captionLabel.font = UIFont(name: "Rockwell", size: 25)
         self.view.addSubview(self.captionLabel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.updateCaption(Pup.name + " had an amazing day at the " + amusementPark.name + "!")
        }
    }

}
    
   
    @IBAction func Button1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
           
           
                self.Button2.transform = .identity
                self.Button3.transform = .identity
                self.Button1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
           
          
                            })
        
        showChooseButton1()
    }
    
    @IBAction func Button2Clicked(_ sender: UIButton) {
           UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
              
                    self.Button1.transform = .identity
                    self.Button3.transform = .identity
                    self.Button2.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                 
               
                        })
        showChooseButton2()
       }
    
    @IBAction func Button3Clicked(_ sender: UIButton) {
              UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                                      
                 
                    self.Button2.transform = .identity
                    self.Button1.transform = .identity
                        self.Button3.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    
                   
                                })
              
        showChooseButton3()
          }
    
  
    @IBAction func userClickedAnywhere(_ sender: Any) {
    
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.Button1.transform = . identity
            self.Button2.transform = . identity
            self.Button3.transform = . identity

        })
        
        chooseButton.isHidden = true
    }


}

struct userAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
}

struct amusementPark {
    static var name = "Amusement Park"
    static var imageName = "amusement2"
    
}

struct Pup {
    static var name = "Pup"
    static var imageName = "dog"
}

