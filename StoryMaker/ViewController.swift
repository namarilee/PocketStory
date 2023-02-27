//
//  ViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/2/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    var userResponses: [String] = []
    
    var player: AVAudioPlayer!

    static var instance: ViewController!
    
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
        ViewController.instance = self
         playSound(soundFile: "Eb ")
    }
    
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    var soundFileNameURL: NSURL = NSURL()
    var soundFileName = ""
    func playSound(soundFile: String) {
         soundFileName = soundFile
        soundFileNameURL = Bundle.main.url(forResource: soundFile, withExtension: "mp3")! as NSURL
        do {
            player = try AVAudioPlayer(contentsOf: soundFileNameURL as URL)
            player.prepareToPlay()
            player.play()
            player.numberOfLoops = -1
        } catch {
            print("Could not play sound file!")
        }
        
        
    }
    
    func stopSound() {
        player.stop()
        print("music stopped")
    }
    
    func pauseSound() {
        player.pause()
    }
    
}

