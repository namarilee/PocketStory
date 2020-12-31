//
//  PingPong.swift
//  StoryMaker
//
//  Created by Marina Lee on 12/30/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import Foundation
import UIKit
struct PingPong {
  //  var bg = BackgroundSelect()
    let paddle1 = UIImageView()
    let paddle2 = UIImageView()

     func startPongGame() {
//        bg.questionLabel.isHidden = true
//        bg.Button1.isHidden = true
//        bg.Button2.isHidden = true
//        bg.Button3.isHidden = true
//        bg.skipButton.isHidden = true
        paddle1.frame = CGRect(x: 230, y: 100, width: 540, height: 540)
        paddle1.image = UIImage(named: "paddle1")
        
    }
}

