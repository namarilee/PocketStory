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
    
    
    
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    
    
    @IBOutlet weak var amuseBackground: UIImageView!
    
    
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
                view.addBackground(imageName: "amusement2", contentMode: .scaleAspectFit)

                      }


         /*  if row > 2 {
                print("success")
                let HungryView = Mainstory.instantiateViewController(withIdentifier: "Hungry")

                self.present(HungryView, animated: true, completion: nil)
            } */
             questionLabel.text = questions[row]
            

            
            userAnswers.background = sender.title (for: .normal)!
            
            userAnswers.character = sender.title (for: .normal)!
            
            userAnswers.food = sender.title (for: .normal)!

            print(userAnswers.background)
            
     Button1.setImage(answers[row][0] as? UIImage, for: .normal)        /*
            Button2.setTitle(answers[row][1], for: .normal)
            Button3.setTitle(answers[row][2], for: .normal) */
            
           
        }
        
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

