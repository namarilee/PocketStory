//
//  PizzaGameView.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PizzaGameView: UIView {

    private var parent: AbstractGamesViewController
    private var greatJobImageView: UIImageView

    let foodGameLabel = UILabel(
        frame: CGRect(
            x: 0,
            y: (Int)(UIScreen.main.bounds.size.height / 2) - 247,
            width: Int(UIScreen.main.bounds.size.width),
            height: 200))
    let foodGameImageView = UIImageView()
    let progressImageView = UIImageView()
    let darkImageView = UIImageView()
    let numButtons = [UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom),
                      UIButton(type: UIButton.ButtonType.custom)]

    let pizzaDisplays = [UIImage(named: "1pizza"), UIImage(named: "2pizza"), UIImage(named: "3pizza"), UIImage(named: "4pizza"), UIImage(named: "5pizza")]

    var foodGameCount = 0

    init(parent: AbstractGamesViewController, numSelectors: [Selector]) {
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
        foodGameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: getFlexFontSize())
        foodGameLabel.text = "How many pizza slices are there?"
        foodGameLabel.textAlignment = .center
        addSubview(foodGameLabel)
        NSLayoutConstraint.activate([
            foodGameLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            foodGameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        foodGameImageView.frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 198,
            y: (Int)(UIScreen.main.bounds.size.height / 2) - 157,
            width: 394,
            height: 225)
        foodGameImageView.image = pizzaDisplays[Int.random(in: 0...4)]
        addSubview(foodGameImageView)
        progressImageView.frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 438,
            y: (Int)(UIScreen.main.bounds.size.height / 2) - 107,
            width: 100,
            height: 200)
        progressImageView.image = parent.gameProgressBar[0]
        addSubview(progressImageView)
        darkImageView.image = UIImage(named: "darkFaded")
        addSubview(darkImageView)
        darkImageView.isHidden = true
        //1
        numButtons[0].frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 350,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 110,
            height: 110)
        let num1Image = UIImage(named: "num1")
        numButtons[0].setImage(num1Image, for: .normal)
        addSubview(numButtons[0])
        numButtons[0].addTarget(parent, action: numSelectors[0], for: .touchUpInside)
        //2
        numButtons[1].frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 200,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 110,
            height: 110)
        let num2Image = UIImage(named: "num2")
        numButtons[1].setImage(num2Image, for: .normal)
        addSubview(numButtons[1])
        numButtons[1].addTarget(parent, action: numSelectors[1], for: .touchUpInside)
        //3
        numButtons[2].frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 50,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 110,
            height: 110)
        let num3Image = UIImage(named: "num3")
        numButtons[2].setImage(num3Image, for: .normal)
        addSubview(numButtons[2])
        numButtons[2].addTarget(parent, action: numSelectors[2], for: .touchUpInside)
        //4
        numButtons[3].frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) + 100,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 110,
            height: 110)
        let num4Image = UIImage(named: "num4")
        numButtons[3].setImage(num4Image, for: .normal)
        addSubview(numButtons[3])
        numButtons[3].addTarget(parent, action: numSelectors[3], for: .touchUpInside)
        //5
        numButtons[4].frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) + 250,
            y: (Int)(UIScreen.main.bounds.size.height / 2) + 43,
            width: 110,
            height: 110)
        let num5Image = UIImage(named: "num5")
        numButtons[4].setImage(num5Image, for: .normal)
        addSubview(numButtons[4])
        numButtons[4].addTarget(parent, action: numSelectors[4], for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getFlexFontSize() -> CGFloat {
        if (UIScreen.main.bounds.size.height < 420) {
            return 30
        } else if (UIScreen.main.bounds.size.height > 700) {
            return 50
        } else {
            return UIScreen.main.bounds.size.height / 14
        }
    }

    func reloadPizzaImageView() {
        foodGameImageView.image = pizzaDisplays[Int.random(in: 0...4)]
    }
    
    func isPizzaDisplayed(_ displayIndex: Int) -> Bool {
        return foodGameImageView.image == pizzaDisplays[displayIndex]
    }
    
    func animateNumber(_ number: UIButton) {
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            number.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            number.transform = .identity
            }
        })
    }

    func animatePizzaQ() {
        let originalTransform = foodGameImageView.transform
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options:[], animations: {
            self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
            for i in 0...4 {
                self.numButtons[i].transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.size.height / 2)
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.foodGameImageView.isHidden = true
            self.foodGameImageView.transform = originalTransform
        }
    }
    
    func showGreatJob() {
        darkImageView.isHidden = false
        greatJobImageView.isHidden = false
    }

    func reloadPizza() {
        greatJobImageView.isHidden = true
        foodGameCount += 1
        print("pizzaCount: ", foodGameCount)
        progressImageView.image = parent.gameProgressBar[foodGameCount]
        foodGameImageView.frame = CGRect(
            x: (Int)(UIScreen.main.bounds.size.width / 2) - 198,
            y: (Int)(UIScreen.main.bounds.size.height / 2) - 157,
            width: 394,
            height: 225)
        reloadPizzaImageView()
        foodGameImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            for i in 0...4 {
                self.numButtons[i].transform = .identity
            }
        })
        if foodGameCount == 5 {
            hidePizzaGame()
            backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
            removeBackground()
            parent.pizzaGameCoordinator = nil

            AbstractGamesViewController.instance.photoboothIntro()
        
        }
    }

    func hidePizzaGame() {
        foodGameLabel.isHidden = true
        foodGameImageView.isHidden = true
        progressImageView.isHidden = true
        for i in 0...4 {
            numButtons[i].isHidden = true
        }
    }

    func handleNumClicked(_ buttonIndex: Int) {
        if isPizzaDisplayed(buttonIndex) {
            animateNumber(numButtons[buttonIndex])
            for i in 0...4 {
                if i != buttonIndex {
                    numButtons[i].alpha = 0.5
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animatePizzaQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadPizza()
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
