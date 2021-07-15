//
//  HotdogGameView.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class HotdogGameView: UIView {

    private var parent: AbstractGamesViewController

    let foodGameLabel = UILabel(frame: CGRect(x: 200, y: -40, width: 620, height: 200))
    let foodGameImageView = UIImageView()
    let progressImageView = UIImageView()
    let darkImageView = UIImageView()
    let greatJobImageView = UIImageView()
    let numButtons = [UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom)]

    let hotdogDisplays = [UIImage(named: "redHD"), UIImage(named: "greenHD"), UIImage(named: "purpleHD"), UIImage(named: "blueHD"), UIImage(named: "orangeHD")]

    let redLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    let greenLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    let purpleLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    let blueLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    let orangeLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))

    var foodGameCount = 0

    init(parent: AbstractGamesViewController, numSelectors: [Selector]) {
        self.parent = parent
        super.init(frame: .zero)

        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = hotdogDisplays[Int.random(in: 0...4)]
        addSubview(foodGameImageView)
        addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        progressImageView.frame = CGRect(x: 10, y: 100, width: 100, height: 200)
        progressImageView.image = parent.gameProgressBar[0]
        addSubview(progressImageView)
        darkImageView.image = UIImage(named: "darkFaded")
        addSubview(darkImageView)
        darkImageView.isHidden = true
        greatJobImageView.frame = CGRect(x: 230, y: 100, width: 431.3, height: 204.6)
        greatJobImageView.image = UIImage(named: "greatJob")
        addSubview(greatJobImageView)
        greatJobImageView.isHidden = true
        foodGameLabel.isHidden = false
        foodGameLabel.frame = CGRect(x: 320, y: -40, width: 620, height: 200)
        foodGameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        foodGameLabel.text = "Match the color!"
        addSubview(foodGameLabel)

        numButtons[0].frame = CGRect(x: 90, y: 250, width: 130, height: 130)
        let num1Image = UIImage(named: "redHotdog")
        numButtons[0].setImage(num1Image, for: .normal)
        addSubview(numButtons[0])
        numButtons[0].addTarget(parent, action: numSelectors[0], for: .touchUpInside)
        
        numButtons[1].frame = CGRect(x: 240, y: 250, width: 130, height: 130)
        let num2Image = UIImage(named: "greenHotdog")
        numButtons[1].setImage(num2Image, for: .normal)
        addSubview(numButtons[1])
        numButtons[1].addTarget(parent, action: numSelectors[1], for: .touchUpInside)

        numButtons[2].frame = CGRect(x: 390, y: 250, width: 130, height: 130)
        let num3Image = UIImage(named: "purpleHotdog")
        numButtons[2].setImage(num3Image, for: .normal)
        addSubview(numButtons[2])
        numButtons[2].addTarget(parent, action: numSelectors[2], for: .touchUpInside)

        numButtons[3].frame = CGRect(x: 540, y: 250, width: 130, height: 130)
        let num4Image = UIImage(named: "blueHotdog")
        numButtons[3].setImage(num4Image, for: .normal)
        addSubview(numButtons[3])
        numButtons[3].addTarget(parent, action: numSelectors[3], for: .touchUpInside)

        numButtons[4].frame = CGRect(x: 690, y: 250, width: 130, height: 130)
        let num5Image = UIImage(named: "orangeHotdog")
        numButtons[4].setImage(num5Image, for: .normal)
        addSubview(numButtons[4])
        numButtons[4].addTarget(parent, action: numSelectors[4], for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isHotdogDisplayed(_ displayIndex: Int) -> Bool {
        return foodGameImageView.image == hotdogDisplays[displayIndex]
    }
    
    func animateNumber(_ number: UIButton) {
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            number.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            number.transform = .identity
            }
        })
    }

    func animateHotdogQ() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options:[], animations: {
            self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
            for i in 0...4 {
                self.numButtons[i].transform = CGAffineTransform(translationX: 0, y: 200)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.foodGameImageView.isHidden = true
        }
    }
    
    func showGreatJob() {
        darkImageView.isHidden = false
        greatJobImageView.isHidden = false
    }

    func reloadHotdog() {
        greatJobImageView.isHidden = true
        foodGameCount += 1
        print("foodGameCount: ", foodGameCount)
        progressImageView.image = parent.gameProgressBar[foodGameCount]
        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = hotdogDisplays[Int.random(in: 0...4)]
        
        self.foodGameImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
            for i in 0...4 {
                self.numButtons[i].transform = .identity
            }
        })
        if foodGameCount == 5 {
            self.hideHotdogGame()
            backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
            removeBackground()
            parent.hotdogGameCoordinator = nil
            AbstractGamesViewController.instance.photoboothIntro()

        }
    }

    func hideHotdogGame() {
        foodGameLabel.isHidden = true
        progressImageView.isHidden = true
        foodGameImageView.isHidden = true
        redLabel.isHidden = true
        greenLabel.isHidden = true
        purpleLabel.isHidden = true
        blueLabel.isHidden = true
        orangeLabel.isHidden = true
        for i in 0...4 {
            numButtons[i].isHidden = true
        }
    }

    func handleNumClicked(_ buttonIndex: Int) {
        if isHotdogDisplayed(buttonIndex) {
            animateNumber(numButtons[buttonIndex])
            for i in 0...4 {
                if i != buttonIndex {
                    numButtons[i].alpha = 0.5
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animateHotdogQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadHotdog()
                    for i in 0...4 {
                        if i != buttonIndex {
                            self.numButtons[i].alpha = 1
                        }
                    }
                }
            }
        } else {
            numButtons[buttonIndex].alpha = 0.5
        }
    }
}
