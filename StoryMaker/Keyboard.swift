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
}
