//
//  Keyboard.swift
//  StoryMaker
//
//  Created by Marina Lee on 1/4/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class Keyboard: UIViewController {
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // @IBAction func c1pressed(_ sender: Any) {
    
    @IBAction func c1pressed(_ sender: Any) {
        
        let url = Bundle.main.url(forResource: "c1piano", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    @IBAction func cSharpPressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "c#piano", withExtension: "wav")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
        
    }
    
    
   
    @IBAction func dPressed(_ sender: Any) {
    
    let url = Bundle.main.url(forResource: "dpiano", withExtension: "wav")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
    
    }
    
    @IBAction func dSharpPressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "dsharppiano", withExtension: "wav")
                 player = try! AVAudioPlayer(contentsOf: url!)
                 player.play()
    }
    
    
    @IBAction func ePressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "epiano", withExtension: "wav")
                 player = try! AVAudioPlayer(contentsOf: url!)
                 player.play()
    }
    
    @IBAction func fPressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "fpiano", withExtension: "wav")
                 player = try! AVAudioPlayer(contentsOf: url!)
                 player.play()
    }
    
    
    @IBAction func fSharpPressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "fsharppiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    @IBAction func gPressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "gpiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    @IBAction func gsharppressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "gsharppiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    
    @IBAction func apressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "apiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    @IBAction func bflatpressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "bflatpiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    @IBAction func bpressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "bpiano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    
    @IBAction func c2pressed(_ sender: Any) {
        let url = Bundle.main.url(forResource: "c2piano", withExtension: "wav")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
    }
    
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        ViewController.instance.playSound(soundFile: "dixielandost (1)")

    }
}
