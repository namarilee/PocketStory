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
    let ball = UIImageView()

     func startPongGame() {
        paddle1.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
        paddle1.image = UIImage(named: "paddle1")
        paddle2.frame = CGRect(x: 750, y: 100, width: 200, height: 200)
        paddle2.image = UIImage(named: "paddle2")
        ball.frame = CGRect(x: 430, y: 200, width: 50, height: 50)
        ball.image = UIImage(named: "ball")
        paddle2.isUserInteractionEnabled = true

        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
           // self.paddle1.frame = CGRect(x: 0 + self.pongBounds, y: 100, width: 200, height: 200)
           
           // let what = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100))) + 1)

           // self.ball.frame = CGRect(x: 430, y: 200, width: 50, height: 50)

            UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                self.paddle1.transform = CGAffineTransform(translationX: 0, y: -140)
            }, completion: nil)
           // DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [self] in
                    self.paddle1.transform = CGAffineTransform(translationX: 0, y: 180)
                }, completion: nil)
           // }
          
        }
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t2) in
                      self.ball.center.x += 2
            if self.ball.center.x - 25 > self.paddle2.center.x - 100 && self.ball.center.x + 25 < self.paddle2.center.x + 100 && self.ball.center.y > self.paddle2.center.y - 100 {
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t3) in
                    self.ball.center.x -= 1
                })
            }
        })
    }
}

