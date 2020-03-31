//
//  ViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/2/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userResponses: [String] = []
    
    @IBAction func amusementPark(_ sender: Any) {
        userResponses.append("Amusement park")
        print(userResponses)
        
    }

    @IBAction func birthdayParty(_ sender: Any) {
        userResponses.append("Birthday party")
        print(userResponses)

    }
    
    
    @IBAction func school(_ sender: Any) {
        userResponses.append("school")
        print(userResponses)

    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
           
          
        print(sender.currentTitle!)
           //Reduces the sender's (the button that got pressed) opacity to half.
           
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
}

