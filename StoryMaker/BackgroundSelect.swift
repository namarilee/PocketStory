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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        
        Button1.setImage(UIImage(named: "amusement"), for: .normal)
        
        
        
        Button1.imageView?.contentMode = .scaleAspectFit
        
        /*  Button2.setTitle(answers[row][1], for: .normal)
         
         Button3.setTitle(answers[row][2], for: .normal) */
        
    }
    
    let Mainstory : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        
        row += 1
        print(row)
        
        if row == 1 && sender == Button1 {
            view.addBackground(imageName: "amusement2", contentMode: .scaleAspectFill)
            
            questionLabel.isHidden = true
            Button1.isHidden = true
            Button2.isHidden = true
            Button3.isHidden = true
            
            let imageView = UIImageView(frame: CGRect(x: 180, y: 450, width: 100, height: 150))
            imageView.image = UIImage(named: "dog")
            self.view.addSubview(imageView)
            
            
            UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                imageView.transform = CGAffineTransform(translationX: 0, y: -150)
                
            })
            
            let speechBubble = UIImageView(frame: CGRect(x: 220, y: 240, width: 500, height: 300))
            speechBubble.image = UIImage(named: "speechBubble")
            self.view.addSubview(speechBubble)
            
            speechBubble.alpha = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                speechBubble.alpha = 1
                
            }
            
            UIView.animate(withDuration: 1, delay: 3.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                
                speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
                
                
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                let label = UILabel(frame: CGRect(x: 320, y: 290, width: 500, height: 21))
                label.font = UIFont(name: "Rockwell", size: 18)
                label.text = "Welcome to the amusement park!"
                self.view.addSubview(label)
                label.animate(newText: label.text ?? "", characterDelay: 0.07)
            }
            
          
            
            
            let helloImage = UIImage(named: "hello")
            let helloButton   = UIButton(type: UIButton.ButtonType.custom) as UIButton
            
            helloButton.frame = CGRect(x: 620, y: 330, width: 72, height: 54)
            helloButton.setImage(helloImage, for: .normal)
            
            
            
            self.view.addSubview(helloButton)
            
           
            
            
            helloButton.alpha = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                helloButton.alpha = 1
            }
            
            UIView.animate(withDuration: 1, delay: 7.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                
                helloButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                

                
            })
            
       //     helloButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)

        }
        
        questionLabel.text = questions[row]
        
        userAnswers.background = sender.title (for: .normal)!
        
        userAnswers.character = sender.title (for: .normal)!
        
        userAnswers.food = sender.title (for: .normal)!
        
        print(userAnswers.background)

    }
    
    //   Button1.setImage(answers[row][0] as? UIImage, for: .normal)
    /*
     Button2.setTitle(answers[row][1], for: .normal)
     Button3.setTitle(answers[row][2], for: .normal) */
    
    


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */




}

struct userAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
}

