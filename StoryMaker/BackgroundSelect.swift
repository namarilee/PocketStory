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
    
    var answer0 = [
        UIImage(imageLiteralResourceName: "amusement"),
        "Birthday party",
        "School"] as [Any]
    
    var answer1 = [UIImage(imageLiteralResourceName: "dog"), "Bear", "Cat"] as [Any]
    
    var answer2 = [UIImage(imageLiteralResourceName: "pizza"), "Hotdog", "Popcorn"] as [Any]
    
    var answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    var answer4 = ["Ping pong", "Xylophone", "Basketball"]
    
    
    var answers = [
        [UIImage(imageLiteralResourceName: "amusement2"), "2", "School"],
        [UIImage(imageLiteralResourceName: "dog"), "Bear", "Cat"],
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
    
    var row = 0
    
    var label = UILabel(frame: CGRect(x: 320, y: 290, width: 500, height: 21))

    var helloButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
    
    var character =  UIImageView(frame: CGRect(x: 180, y: 450, width: 100, height: 150))
    
    var speechBubble = UIImageView(frame: CGRect(x: 220, y: 240, width: 500, height: 300))
    
    var count = 0
    
  //  var amuseBG = UIView(imageLiteralResourceName: "amusement2")
        
     
    
    func hideButtonQuestions() {
        questionLabel.isHidden = true
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        label.isHidden = true
    }

    func showButtonQuestions() {
        questionLabel.isHidden = false
        Button1.isHidden = false
        Button2.isHidden = false
        Button3.isHidden = false
        label.isHidden = false
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
            self.speechBubble.alpha = 0
            self.speechBubble.alpha = 1
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
    }
    
    func addMessageToSpeechBubble(_ message: String) {
        self.label.isHidden = false
        self.label.font = UIFont(name: "Rockwell", size: 18)
        self.label.text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.view.addSubview(self.label)
            self.label.animate(newText: self.label.text ?? "", characterDelay: 0.07)
        }
    }
    
    func hideIntro() {
        view.isHidden = true
        character.isHidden = true
        speechBubble.isHidden = true
        helloButton.isHidden = true
        label.isHidden = true
        
    
    }
    
    func hideBackground() {
        self.view.backgroundColor = #colorLiteral(red: 0.641756475, green: 0.8999739885, blue: 0.8605425358, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        Button1.setImage(UIImage(named: "amusement"), for: .normal)
        
        Button1.imageView?.contentMode = .scaleAspectFit
        
        Button2.setTitle(answer0[1] as! String, for: .normal)
        Button3.setTitle(answer0[2] as! String, for: .normal)
        
    }
    
    let Mainstory : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        
        row += 1
        print(row)
        
        if row == 1 {
            hideButtonQuestions()
            if sender == Button1 {
                view.addBackground(imageName: "amusement2", contentMode: .scaleAspectFill)
            }
            
        showCharacter()
            
            showSpeechBubble()
        
            
            addMessageToSpeechBubble("Welcome to the amusement park!")
            
        
            
           
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
            
       

            //helloButton.alpha = 0
            
         //   helloButton.alpha = 1
            
            
            
    

        }
        
        questionLabel.text = questions[row]
        
        userAnswers.background = sender.title (for: .normal)!
        
        userAnswers.character = sender.title (for: .normal)!
        
        userAnswers.food = sender.title (for: .normal)!
        
        print(userAnswers.background)

    }
    
    
    @IBAction func helloButtonClicked(_ sender: UIButton) {
            count += 1
            print(count)
        
        if self.count == 1 {
            
            self.label.font = UIFont(name: "Rockwell", size: 18)
            helloButton.isHidden = true
            self.label.text = "Let's choose a character!"
            self.view.addSubview(self.label)
            self.label.animate(newText: self.label.text ?? "", characterDelay: 0.07)
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
                self.helloButton.isHidden = false
                let helloImage = UIImage(named: "Next button")
                self.helloButton.setImage(helloImage, for: .normal)
            }
        
        }
            if self.count == 2 {
                 self.helloButton.removeTarget(self, action: #selector(self.helloButtonClicked), for: .touchUpInside)
                self.hideIntro()
                self.hideBackground()
                self.showButtonQuestions()
                
            }
            
            
            
       
           
            
        
    }
    
    

}

struct userAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
}

