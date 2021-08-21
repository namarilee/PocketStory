//
//  PopcornGameView.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PopcornGameView: UIView {

    private var parent: AbstractGamesViewController
    private var greatJobImageView: UIImageView

    let darkImageView = UIImageView()
    let popcornCountLabel = UILabel(frame: CGRect(
                                        x: (Int)(UIScreen.main.bounds.size.width) - 125,
                                        y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
                                        width: 620,
                                        height: 200))
    let basketImageView = UIImageView()
    let pCounterImageView = UIImageView()
    let maxScore = 5
    var currentScore = 0

    init(parent: AbstractGamesViewController) {
        self.parent = parent
        self.greatJobImageView = parent.getGreatJobImageView()
        super.init(frame: .zero)
        print("UIScreen width: ", UIScreen.main.bounds.size.width)
        print("UIScreen height: ", UIScreen.main.bounds.size.height)

        addSubview(greatJobImageView)
        greatJobImageView.isHidden = true
        greatJobImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greatJobImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            greatJobImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            greatJobImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        popcornCountLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
        popcornCountLabel.text = "0"
        addSubview(popcornCountLabel)
        basketImageView.isUserInteractionEnabled = true
        basketImageView.frame = CGRect(
            x: 100,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 73,
            width: 150,
            height: 150)
        basketImageView.image = UIImage(named: "popcornContainer")
        addSubview(basketImageView)
        pCounterImageView.frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width) - 146,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 200,
            height: 200)
        pCounterImageView.image = UIImage(named: "kernel")
        addSubview(pCounterImageView)

        basketImageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(PopcornGameView.moveBasket(_:))))
        addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        Timer.scheduledTimer(withTimeInterval: 2.1, repeats: true) { (t1) in
            let randomPopcorn = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width - 100))) + 1)
            let kernelImageView = UIImageView()
            kernelImageView.frame = CGRect(
                x: randomPopcorn + 30,
                y: (Int)(UIScreen.main.bounds.size.height / 2) - 177,
                width: 100,
                height: 100)
            kernelImageView.image = UIImage(named: "kernel")
            self.addSubview(kernelImageView)
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t2) in
                kernelImageView.center.y += 1
                if kernelImageView.center.x - 50 > self.basketImageView.center.x - 75 && kernelImageView.center.x + 50 < self.basketImageView.center.x + 75 && kernelImageView.center.y > self.basketImageView.center.y - 75 {
                    self.currentScore += 1
                    self.popcornCountLabel.text = "\(self.currentScore)"
                    kernelImageView.center.y = -100000

                    if self.currentScore == self.maxScore {
                        kernelImageView.isHidden = true
                        t1.invalidate()
                        t2.invalidate()
                        self.showGreatJob()
                        self.basketImageView.isHidden = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                self.hidePopcornGame()
                                self.greatJobImageView.isHidden = true
                                AbstractGamesViewController.instance.photoboothIntro()
                          
                        }
                    }
                }
            })
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showGreatJob() {
        darkImageView.isHidden = false
        greatJobImageView.isHidden = false
    }

    func hidePopcornGame() {
        popcornCountLabel.isHidden = true
        pCounterImageView.isHidden = true
        basketImageView.isHidden = true
    }

    @objc func moveBasket(_ recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translation(in: self)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self)
    }

}
