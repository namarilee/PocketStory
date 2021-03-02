//
//  PingPongViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/27/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PingPongViewController: UIViewController {
    
    @IBOutlet weak var paddle1: UIImageView!
    @IBOutlet weak var paddle2: UIImageView!
    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var pongScoreLabel: UILabel!
    
    var pongCurrentScore = 0
    var gameActive = true
    var movingRight = true

    override func viewDidLoad() {
        super.viewDidLoad()

        startPongGame()
        view.addSubview(ball)
        ball.translatesAutoresizingMaskIntoConstraints = true
        paddle2.translatesAutoresizingMaskIntoConstraints = true
        paddle2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(PingPongViewController.movePaddle(_:))))
    }

    func startPongGame() {
        paddle2.isUserInteractionEnabled = true
        pongScoreLabel.text = "0"

        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
            UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                self.paddle1.transform = CGAffineTransform(translationX: 0, y: -140)
            }, completion: nil)
            
            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { [self] in
                self.paddle1.transform = CGAffineTransform(translationX: 0, y: 180)
            }, completion: nil)
        }

        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t2) in
            if (self.movingRight) {
                ballMoveRight()
            } else {
                ballMoveLeft()
            }
            if self.ball.center.x - 25 > self.paddle2.center.x - 100 && self.ball.center.x + 25 < self.paddle2.center.x + 100 && self.ball.center.y > self.paddle2.center.y - 100 {
                self.pongCurrentScore += 1
                self.pongScoreLabel.text = "\(self.pongCurrentScore)"
                self.movingRight = false
            }
            if self.ball.center.x - 25 > self.paddle1.center.x - 100 && self.ball.center.x + 25 < self.paddle1.center.x + 100 && self.ball.center.y > self.paddle1.center.y - 100 {
                self.movingRight = true
            }
        })

        func ballMoveRight() {
            self.ball.center.x += 2
        }

        func ballMoveLeft() {
            self.ball.center.x -= 2
        }

    }

    @objc func movePaddle(_ recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }

}
