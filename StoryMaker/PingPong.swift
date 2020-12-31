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
    //let pongBounds = Int(UInt32((Int)(UIScreen.main.bounds.size.width-100)) + 1)
     func startPongGame() {
       // BackgroundSelect().skipButton.isHidden = true
        paddle1.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
        paddle1.image = UIImage(named: "paddle1")
        paddle2.frame = CGRect(x: 500, y: 100, width: 200, height: 200)
        paddle2.image = UIImage(named: "paddle2")
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
           // self.paddle1.frame = CGRect(x: 0 + self.pongBounds, y: 100, width: 200, height: 200)
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: { [self] in
                self.paddle1.transform = CGAffineTransform(translationX: 0, y: -90)
            }, completion: nil)
           // DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { [self] in
                    self.paddle1.transform = CGAffineTransform(translationX: 0, y: 130)
                }, completion: nil)
           // }
        }
    }
}

