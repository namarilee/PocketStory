//
//  BackgroundSelect.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/23/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit

class BackgroundSelect: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!

    let answer0 = [
        "Amusement",
        "School",
        "Farm"]
    
    let answer1 = [ "dog", "cat",  "cow"]
    
    let answer2 = ["pizza", "Hotdog", "Popcorn"]
    
    let answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    let answer4 = ["Ping pong", "Xylophone", "Basketball"]
    
    let answers = [
        ["Amusement", "School", "Farm"],
        ["dog",  "cat",  "cow"],
        ["pizza", "Hotdog", "Popcorn"],
        ["Ping pong", "Xylophone", "Basketball"]
    ]
    
    let questions =
        ["Where would you like your story to be?",
         "Let's start building your story! Choose a character.",
         "Choose a food item!",
         "Choose a food item!",
         "What would you like to play?"]
    
    let imageLabels = [
        ["Amusement Park", "School", "Farm"],
        ["Pup", "Whiskers", "Bessie"],
        ["Pizza", "Hotdog", "Popcorn"]
    ]
    
    let pizzaDisplays = [UIImage(named: "1pizza"), UIImage(named: "2pizza"), UIImage(named: "3pizza"), UIImage(named: "4pizza"), UIImage(named: "5pizza")]

    let hotdogDisplays = [UIImage(named: "redHD"), UIImage(named: "greenHD"), UIImage(named: "purpleHD"), UIImage(named: "blueHD"), UIImage(named: "orangeHD")]

    let gameProgressBar = [UIImage(named: "p0"), UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3"), UIImage(named: "p4"), UIImage(named: "p5")]
    
    var row = 0
    
    var introLabel = AnimatedUILabel(frame: CGRect(x: 320, y: 290, width: 500, height: 21))
    
    var promptButton = UIButton(type: UIButton.ButtonType.custom)
    
    var showPromptButtenWorkItem: DispatchWorkItem?
    
    var character =  UIImageView(frame: CGRect(x: 180, y: 450, width: 100, height: 150))
    
    var speechBubble = UIImageView(frame: CGRect(x: 220, y: 240, width: 500, height: 300))
    
    let speechBubbleButtonFrame = CGRect(x: 620, y: 330, width: 72, height: 54)

    var showSpeechBubbleWorkItem: DispatchWorkItem?

    var addMessageToSpeechBubbleWorkItem: DispatchWorkItem?

    var chooseButton = UIButton(type: UIButton.ButtonType.custom)
    
    var playMyStoryButton = UIButton(type: UIButton.ButtonType.custom)
    
    var captionRect = UIImageView(frame: CGRect(x: 250, y: 20, width: 416.5, height: 100))
    
    let captionButtonFrame = CGRect(x: 620, y: 100, width: 90, height: 54)
    
    var captionLabel = AnimatedUILabel(frame: CGRect(x: 170, y: -35, width: 580, height: 200))
    
    var delayedCaptionWorkItem: DispatchWorkItem?

    var storyTitle = UILabel(frame: CGRect(x: 210, y: 125, width: 497, height: 165))
    
    var chosenCharacter =  UIImageView(frame: CGRect(x: 340, y: 240, width: 100, height: 150))
    
    var chosenFood =  UIImageView(frame: CGRect(x: 340, y: 240, width: 100, height: 150))
    
    var dogHappy = UIImageView(frame: CGRect(x: 125, y: 260, width: 92, height: 136.36))
    
    var skipButton = UIButton(type: UIButton.ButtonType.custom)

    
  //  var captionLabel = UILabel(frame: CGRect(x: 170, y: -35, width: 620, height: 200))

    
    //  var anywhereButton = UIButton(frame: CGRect(x: 0, y: 0, width: 900, height: 500))
    
    @IBOutlet weak var anywhereButton: UIButton!
    
    var count = 0
    
    var currentAnimation = 0
    var pingPong = PingPong()
    
    func hideButtonQuestions() {
        questionLabel.isHidden = true
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        introLabel.isHidden = true
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        chooseButton.isHidden = true
        
    }
    
    func showButtonQuestions() {
        questionLabel.isHidden = false
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        introLabel.isHidden = false
        label1.isHidden = false
        label2.isHidden = false
        label3.isHidden = false
        view.backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
        view.removeBackground()
    }
    
    func showCharacter() {
        character.image = UIImage(named: "dog")
        self.view.addSubview(character)
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.character.transform = CGAffineTransform(translationX: 0, y: -150)
        })
    }

    func showSpeechBubble() {
        speechBubble.image = UIImage(named: "speechBubble")
        showSpeechBubbleWorkItem = DispatchWorkItem {
            self.view.addSubview(self.speechBubble)
            self.speechBubble.isHidden = false
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: showSpeechBubbleWorkItem!)
    }

    func addMessageToSpeechBubble(_ message: String) {
        self.introLabel.isHidden = false
        self.introLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 18)
        self.introLabel.text = message
        addMessageToSpeechBubbleWorkItem = DispatchWorkItem {
            self.view.addSubview(self.introLabel)
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: addMessageToSpeechBubbleWorkItem!)
    }
    
    func hideIntro() {
        character.isHidden = true
        speechBubble.isHidden = true
        promptButton.isHidden = true
        self.introLabel.removeFromSuperview()
    }
    
    func showChooseButton() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "selectButton")
        chooseButton.frame = CGRect(x: 360, y: 320, width: 190, height: 51)
        
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
//
//                      switch self.currentAnimation {
//                          case 0:
//                            self.chooseButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
////                          case 1:
////                              self.chooseButton.transform = .identity
//                          default:
//                              break
//                      }
//
//                  })
        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
    }
    
    func goToCharacterSelect() {
        view.removeBackground()
        questionLabel.text = questions[1]
        label1.text = imageLabels[1][0]
        label1.adjustsFontSizeToFitWidth = true
        button1.setTitle(answers[1][0], for: .normal)
        label2.text = imageLabels[1][1]
        label2.adjustsFontSizeToFitWidth = true
        button2.setTitle(answers[1][1], for: .normal)
        label3.text = imageLabels[1][2]
        label3.adjustsFontSizeToFitWidth = true
        button3.setTitle(answers[1][2], for: .normal)
        button1.setImage(UIImage(named: "dog"), for: .normal)
        button1.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button2.setImage(UIImage(named: "cat"), for: .normal)
        button2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button3.setImage(UIImage(named: "cow"), for: .normal)
        button3.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    func goToFoodSelect() {
           view.removeBackground()
           questionLabel.text = "Choose a food item!"
           label1.text = imageLabels[2][0]
           label1.adjustsFontSizeToFitWidth = true
           button1.setTitle(answers[2][0], for: .normal)
           label2.text = imageLabels[2][1]
           label2.adjustsFontSizeToFitWidth = true
           button2.setTitle(answers[2][1], for: .normal)
           label3.text = imageLabels[2][2]
           label3.adjustsFontSizeToFitWidth = true
           button3.setTitle(answers[2][2], for: .normal)
           button1.setImage(UIImage(named: "pizza"), for: .normal)
           button1.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
           button2.setImage(UIImage(named: "hotdog"), for: .normal)
           button2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
           button3.setImage(UIImage(named: "popcorn"), for: .normal)
           button3.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
           button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
       }
    
    func showCaptionRect() {
        captionRect.image = UIImage(named: "captionRect")
        self.view.addSubview(self.captionRect)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
            self.captionRect.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }
    
    func revertAll() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.button1.transform = . identity
            self.button2.transform = . identity
            self.button3.transform = . identity
        })
    }
    
    func updateCaption(_ caption: String) {
        captionLabel.stopAnimation()
        captionLabel.text = caption
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.numberOfLines = 0
        captionLabel.startAnimation(newText: self.captionLabel.text ?? "", characterDelay: 0.07)
    }
    
    func showStoryTitle(_ title: String) {
        storyTitle.text = title
        storyTitle.adjustsFontSizeToFitWidth = true
        storyTitle.numberOfLines = 0
    }

    func showChosenBackground() {
        if UserAnswers.background == "Amusement" {
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "School" {
            view.addBackground(imageName: School.imageName, contentMode: .scaleAspectFill)
        } else if UserAnswers.background == "Farm" {
            view.addBackground(imageName: Farm.imageName, contentMode: .scaleAspectFill)
        }
    }
    
    func showChosenCharacter() {
        if UserAnswers.character == "dog" {
            chosenCharacter.image = UIImage(named: "dog")
            self.view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cat" {
            chosenCharacter.image = UIImage(named: "cat")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            self.view.addSubview(chosenCharacter)
        } else if UserAnswers.character == "cow" {
            chosenCharacter.image = UIImage(named: "cow")
            chosenCharacter.contentMode = UIView.ContentMode.scaleAspectFit
            self.view.addSubview(chosenCharacter)
        }
    }
    
    func showChosenFood() {
          if UserAnswers.food == "pizza" {
              chosenFood.image = UIImage(named: "pizza")
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == "hotdog" {
              chosenFood.image = UIImage(named: "hotdog")
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          } else if UserAnswers.food == "popcorn" {
              chosenFood.image = UIImage(named: "popcorn")
              chosenFood.contentMode = UIView.ContentMode.scaleAspectFit
              self.view.addSubview(chosenFood)
          }
      }
    
    func characterAnimation() {
        showChosenCharacter()
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 0, y: -200)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.chosenCharacter.isHidden = true
            self.dogHappy.image = UIImage(named: "dogHappy")
            self.view.addSubview(self.dogHappy)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.repeat, .autoreverse], animations: {
                self.dogHappy.transform = CGAffineTransform(translationX: 0, y: -10)
            })
            UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.dogHappy.alpha = 0
            })
        }
    }
    
    func dogWalkLeft() {
        chosenCharacter.image = UIImage(named: "dog")
        self.view.addSubview(chosenCharacter)
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.chosenCharacter.transform = CGAffineTransform(translationX: 100, y: -10)
        })
    }

    func showPromptButton(image: UIImage, frame: CGRect, delay: Double, animation: Int) {
        promptButton.isHidden = true
        promptButton.transform = .identity
        promptButton.setImage(image, for: .normal)
        promptButton.frame = frame
        
        showPromptButtenWorkItem = DispatchWorkItem {
            self.view.bringSubviewToFront(self.promptButton)
            self.promptButton.isHidden = false
            switch animation {
            case 0:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                })
            case 1:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(translationX: 0, y: 200)
                })
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(translationX: 0, y: 100)
                    self.promptButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                })
            case 2:
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                })
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                    self.promptButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            default:
                break;
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: showPromptButtenWorkItem!)
        promptButton.addTarget(self, action: #selector(promptButtonClicked), for: .touchUpInside)
    }

    var foodGameCount = 0
    var progressCount = 0
    func animateNumber(number: UIButton) {
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            number.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            number.transform = .identity
            }
        })
    }

    func animatePizzaQ() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options:[], animations: {
            switch self.currentAnimation {
            case 0:
                self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
                self.num1.transform = CGAffineTransform(translationX: 0, y: 200)
                self.num2.transform = CGAffineTransform(translationX: 0, y: 200)
                self.num3.transform = CGAffineTransform(translationX: 0, y: 200)
                self.num4.transform = CGAffineTransform(translationX: 0, y: 200)
                self.num5.transform = CGAffineTransform(translationX: 0, y: 200)
            default:
                break
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.foodGameImageView.isHidden = true
        }
    }

    func reloadPizza() {
        greatJobImageView.isHidden = true
        foodGameCount += 1
        print("pizzaCount: ", foodGameCount)
        progressImageView.image = gameProgressBar[foodGameCount]
        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = pizzaDisplays[Int.random(in: 0...4)]
        self.foodGameImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
            switch self.currentAnimation {
             case 0:
              self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
              self.num1.transform = .identity
              self.num2.transform = .identity
              self.num3.transform = .identity
              self.num4.transform = .identity
              self.num5.transform = .identity
            default:
                break
            }
        })
        if foodGameCount == 5 {
            self.hidePizzaGame()
            showButtonQuestions()
            view.backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
            view.removeBackground()
            questionLabel.text = "What game would you like to play?"
              }
    }
    var foodGameLabel = UILabel(frame: CGRect(x: 200, y: -40, width: 620, height: 200))
    var foodGameImageView:UIImageView = UIImageView()
    var progressImageView:UIImageView = UIImageView()
    var darkImageView:UIImageView = UIImageView()
    var num1 = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var num2 = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var num3 = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var num4 = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var num5 = UIButton(type: UIButton.ButtonType.custom) as UIButton
    var greatJobImageView:UIImageView = UIImageView()
    
    func showGreatJob() {
        darkImageView.isHidden = false
        greatJobImageView.isHidden = false
    }

    func hidePizzaGame() {
        foodGameLabel.isHidden = true
        foodGameImageView.isHidden = true
        progressImageView.isHidden = true
        num1.isHidden = true
        num2.isHidden = true
        num3.isHidden = true
        num4.isHidden = true
        num5.isHidden = true
    }

    func pizzaGame() {
        foodGameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        foodGameLabel.text = "How many pizza slices are there?"
        view.addSubview(foodGameLabel)
        skipButton.isHidden = true
        hideButtonQuestions()
        view.addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = pizzaDisplays[Int.random(in: 0...4)]
        view.addSubview(foodGameImageView)
         progressImageView.frame = CGRect(x: 10, y: 100, width: 100, height: 200)
        progressImageView.image = gameProgressBar[0]
        view.addSubview(progressImageView)
        darkImageView.image = UIImage(named: "darkFaded")
        view.addSubview(darkImageView)
        darkImageView.isHidden = true
        greatJobImageView.frame = CGRect(x: 230, y: 100, width: 431.3, height: 204.6)
        greatJobImageView.image = UIImage(named: "greatJob")
        view.addSubview(greatJobImageView)
        greatJobImageView.isHidden = true
        //1
        num1.frame = CGRect(x: 90, y: 250, width: 110, height: 110)
        let num1Image = UIImage(named: "num1")
        num1.setImage(num1Image, for: .normal)
        view.addSubview(num1)
        num1.addTarget(self, action: #selector(num1Clicked), for: .touchUpInside)
        //2
        num2.frame = CGRect(x: 240, y: 250, width: 110, height: 110)
        let num2Image = UIImage(named: "num2")
        num2.setImage(num2Image, for: .normal)
        view.addSubview(num2)
        num2.addTarget(self, action: #selector(num2Clicked), for: .touchUpInside)
        //3
        num3.frame = CGRect(x: 390, y: 250, width: 110, height: 110)
        let num3Image = UIImage(named: "num3")
        num3.setImage(num3Image, for: .normal)
        view.addSubview(num3)
        num3.addTarget(self, action: #selector(num3Clicked), for: .touchUpInside)
        //4
        num4.frame = CGRect(x: 540, y: 250, width: 110, height: 110)
        let num4Image = UIImage(named: "num4")
        num4.setImage(num4Image, for: .normal)
        view.addSubview(num4)
        num4.addTarget(self, action: #selector(num4Clicked), for: .touchUpInside)
        //5
        num5.frame = CGRect(x: 690, y: 250, width: 110, height: 110)
        let num5Image = UIImage(named: "num5")
        num5.setImage(num5Image, for: .normal)
        view.addSubview(num5)
        num5.addTarget(self, action: #selector(num5Clicked), for: .touchUpInside)
    }
    
    @IBAction func num1Clicked(_ sender: UIButton) {
        animateNumber(number: num1)
        num2.alpha = 0.5
        num3.alpha = 0.5
        num4.alpha = 0.5
        num5.alpha = 0.5
        if foodGameImageView.image == pizzaDisplays[0] {
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animatePizzaQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadPizza()
                    self.num2.alpha = 1
                    self.num3.alpha = 1
                    self.num4.alpha = 1
                    self.num5.alpha = 1
                         }
            }
         
        }
     else if foodGameImageView.image == hotdogDisplays[0] {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animateHotdogQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadHotdog()
                    self.num2.alpha = 1
                    self.num3.alpha = 1
                    self.num4.alpha = 1
                    self.num5.alpha = 1
                         }
            }
        }
        else {
            num1.alpha = 0.5
        }
    }

    @IBAction func num2Clicked(_ sender: UIButton) {
        animateNumber(number: num2)
        num1.alpha = 0.5
        num3.alpha = 0.5
        num4.alpha = 0.5
        num5.alpha = 0.5

        if foodGameImageView.image == pizzaDisplays[1] {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animatePizzaQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadPizza()
                    self.num1.alpha = 1
                    self.num3.alpha = 1
                    self.num4.alpha = 1
                    self.num5.alpha = 1
                }
            }
        }
       else if foodGameImageView.image == hotdogDisplays[1] {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animateHotdogQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadHotdog()
                    self.num1.alpha = 1
                    self.num3.alpha = 1
                    self.num4.alpha = 1
                    self.num5.alpha = 1
                }
            }
        }
        else {
            num2.alpha = 0.5
        }
    
    }

    @IBAction func num3Clicked(_ sender: UIButton) {
        animateNumber(number: num3)
        num2.alpha = 0.5
        num1.alpha = 0.5
        num4.alpha = 0.5
        num5.alpha = 0.5
    if foodGameImageView.image == pizzaDisplays[2] {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.animatePizzaQ()
            self.showGreatJob()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.reloadPizza()
                self.num2.alpha = 1
                self.num1.alpha = 1
                self.num4.alpha = 1
                self.num5.alpha = 1
            }
        }
    }
    else if foodGameImageView.image == hotdogDisplays[2] {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animateHotdogQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadHotdog()
                    self.num2.alpha = 1
                    self.num1.alpha = 1
                    self.num4.alpha = 1
                    self.num5.alpha = 1
                }
            }
        }
    else {
            num3.alpha = 0.5
        }
    }

    @IBAction func num4Clicked(_ sender: UIButton) {
    if foodGameImageView.image == pizzaDisplays[3] {
        animateNumber(number: num4)
        num2.alpha = 0.5
        num3.alpha = 0.5
        num1.alpha = 0.5
        num5.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.animatePizzaQ()
            self.showGreatJob()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.reloadPizza()
                self.num2.alpha = 1
                self.num3.alpha = 1
                self.num1.alpha = 1
                self.num5.alpha = 1
            }
        }
    }
    else if foodGameImageView.image == hotdogDisplays[3] {
            animateNumber(number: num4)
            num2.alpha = 0.5
            num3.alpha = 0.5
            num1.alpha = 0.5
            num5.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animateHotdogQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadHotdog()
                    self.num2.alpha = 1
                    self.num3.alpha = 1
                    self.num1.alpha = 1
                    self.num5.alpha = 1
                }
            }
        }
    else {
               num4.alpha = 0.5
           }
    }

    @IBAction func num5Clicked(_ sender: UIButton) {
        if foodGameImageView.image == pizzaDisplays[4] {
            animateNumber(number: num5)
            num2.alpha = 0.5
            num3.alpha = 0.5
            num4.alpha = 0.5
            num1.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animatePizzaQ()
                self.showGreatJob()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.reloadPizza()
                    self.num2.alpha = 1
                    self.num3.alpha = 1
                    self.num4.alpha = 1
                    self.num1.alpha = 1
                }
            }
        }
        else if foodGameImageView.image == hotdogDisplays[4] {
                animateNumber(number: num5)
                num2.alpha = 0.5
                num3.alpha = 0.5
                num4.alpha = 0.5
                num1.alpha = 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.animateHotdogQ()
                    self.showGreatJob()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.reloadHotdog()
                        self.num2.alpha = 1
                        self.num3.alpha = 1
                        self.num4.alpha = 1
                        self.num1.alpha = 1
                    }
                }
            }
        else {
               num5.alpha = 0.5
           }
    }

    var redLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    var greenLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    var purpleLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    var blueLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))
    var orangeLabel = UILabel(frame: CGRect(x: 400, y: 30, width: 620, height: 200))

    func hideHotdogGame() {
        foodGameLabel.isHidden = true
        progressImageView.isHidden = true
        foodGameImageView.isHidden = true
        redLabel.isHidden = true
        greenLabel.isHidden = true
        purpleLabel.isHidden = true
        blueLabel.isHidden = true
        orangeLabel.isHidden = true
        num1.isHidden = true
        num2.isHidden = true
        num3.isHidden = true
        num4.isHidden = true
        num5.isHidden = true
    }

    func animateHotdogQ() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options:[], animations: {
                  switch self.currentAnimation {
                  case 0:
                   self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
                      self.num1.transform = CGAffineTransform(translationX: 0, y: 200)
                      self.num2.transform = CGAffineTransform(translationX: 0, y: 200)
                      self.num3.transform = CGAffineTransform(translationX: 0, y: 200)
                      self.num4.transform = CGAffineTransform(translationX: 0, y: 200)
                      self.num5.transform = CGAffineTransform(translationX: 0, y: 200)
                  default:
                      break
                  }
                    })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.foodGameImageView.isHidden = true
            }
    }

    func reloadHotdog() {
        greatJobImageView.isHidden = true
        foodGameCount += 1
        print("foodGameCount: ", foodGameCount)
        progressImageView.image = gameProgressBar[foodGameCount]
        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = hotdogDisplays[Int.random(in: 0...4)]

        self.foodGameImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [], animations: {
              switch self.currentAnimation {
               case 0:
                self.foodGameImageView.transform = CGAffineTransform(translationX: -800, y: 0.00001)
                self.num1.transform = .identity
                self.num2.transform = .identity
                self.num3.transform = .identity
                self.num4.transform = .identity
                self.num5.transform = .identity
              default:
                  break
              }
          })
          if foodGameCount == 5 {
              self.hideHotdogGame()
              showButtonQuestions()
              view.backgroundColor = #colorLiteral(red: 0.8607051969, green: 0.9679742455, blue: 1, alpha: 1)
              view.removeBackground()
              questionLabel.text = "What game would you like to play?"
                }
    }

    func showHotdogGame() {
        foodGameImageView.frame = CGRect(x: 250, y: 50, width: 393.75, height: 225)
        foodGameImageView.image = hotdogDisplays[Int.random(in: 0...4)]
        view.addSubview(foodGameImageView)
        skipButton.isHidden = true
        hideButtonQuestions()
        view.addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        progressImageView.frame = CGRect(x: 10, y: 100, width: 100, height: 200)
        progressImageView.image = gameProgressBar[0]
        view.addSubview(progressImageView)
        darkImageView.image = UIImage(named: "darkFaded")
        view.addSubview(darkImageView)
        darkImageView.isHidden = true
        greatJobImageView.frame = CGRect(x: 230, y: 100, width: 431.3, height: 204.6)
        greatJobImageView.image = UIImage(named: "greatJob")
        view.addSubview(greatJobImageView)
        greatJobImageView.isHidden = true
        foodGameLabel.isHidden = false
        foodGameLabel.frame = CGRect(x: 320, y: -40, width: 620, height: 200)
        foodGameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        foodGameLabel.text = "Match the color!"
        view.addSubview(foodGameLabel)

        num1.frame = CGRect(x: 90, y: 250, width: 130, height: 130)
        let num1Image = UIImage(named: "redHotdog")
        num1.setImage(num1Image, for: .normal)
        view.addSubview(num1)
        num1.addTarget(self, action: #selector(num1Clicked), for: .touchUpInside)
        
        num2.frame = CGRect(x: 240, y: 250, width: 130, height: 130)
        let num2Image = UIImage(named: "greenHotdog")
        num2.setImage(num2Image, for: .normal)
        view.addSubview(num2)
        num2.addTarget(self, action: #selector(num2Clicked), for: .touchUpInside)

        num3.frame = CGRect(x: 390, y: 250, width: 130, height: 130)
        let num3Image = UIImage(named: "purpleHotdog")
        num3.setImage(num3Image, for: .normal)
        view.addSubview(num3)
        num3.addTarget(self, action: #selector(num3Clicked), for: .touchUpInside)

        num4.frame = CGRect(x: 540, y: 250, width: 130, height: 130)
        let num4Image = UIImage(named: "blueHotdog")
        num4.setImage(num4Image, for: .normal)
        view.addSubview(num4)
        num4.addTarget(self, action: #selector(num4Clicked), for: .touchUpInside)

        num5.frame = CGRect(x: 690, y: 250, width: 130, height: 130)
        let num5Image = UIImage(named: "orangeHotdog")
        num5.setImage(num5Image, for: .normal)
            view.addSubview(num5)
            num5.addTarget(self, action: #selector(num5Clicked), for: .touchUpInside)
    }

    func hotdogGame() {
       showHotdogGame()
    }
  //  let popcornGame: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
  //  let popcornViewController = popcornGame.instantiateViewController(withIdentifier: "Hungry") as! BackgroundSelect
    @objc func moveBasket(_ recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }
    var popcornCountLabel = UILabel(frame: CGRect(x: 760, y: 250, width: 620, height: 200))
    let pCounterImageView = UIImageView()
    var currentScore = 0
    let basketImageView = UIImageView()

    func startPopcornGame() {
        hideButtonQuestions()
        greatJobImageView.frame = CGRect(x: 230, y: 100, width: 431.3, height: 204.6)
        greatJobImageView.image = UIImage(named: "greatJob")
        view.addSubview(greatJobImageView)
        greatJobImageView.isHidden = true
           //self.present(popcornViewController, animated: true, completion: nil)
        skipButton.isHidden = true
        popcornCountLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
        popcornCountLabel.text = "0"
        view.addSubview(popcornCountLabel)
        basketImageView.isUserInteractionEnabled = true
        basketImageView.frame = CGRect(x: 100, y: 280, width: 150, height: 150)
        basketImageView.image = UIImage(named: "popcornContainer")
        self.view.addSubview(basketImageView)
        pCounterImageView.frame = CGRect(x: 750, y: 250, width: 200, height: 200)
        pCounterImageView.image = UIImage(named: "kernel")
        self.view.addSubview(pCounterImageView)
        basketImageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(BackgroundSelect.moveBasket(_:))))
        view.addBackground(imageName: "foodTable", contentMode: .scaleAspectFill)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t1) in
            let randomPopcorn = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100))) + 1)
            let kernelImageView = UIImageView()
            kernelImageView.frame = CGRect(x: randomPopcorn + 30, y: 30, width: 100, height: 100)
            kernelImageView.image = UIImage(named: "kernel")
            self.view.addSubview(kernelImageView)
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t2) in
                kernelImageView.center.y += 1
                if kernelImageView.center.x - 50 > self.basketImageView.center.x - 75 && kernelImageView.center.x + 50 < self.basketImageView.center.x + 75 && kernelImageView.center.y > self.basketImageView.center.y - 75 {
                    self.currentScore += 1
                    self.popcornCountLabel.text = "\(self.currentScore)"
                    kernelImageView.center.y = -100000
                    if self.currentScore == 10 {
                        kernelImageView.isHidden = true
                        t1.invalidate()
                        t2.invalidate()
                        self.showGreatJob()
                        self.basketImageView.isHidden = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            self.hidePopcornGame()
                            self.greatJobImageView.isHidden = true
                            self.questionLabel.text = "What would you like to play?"
                        }
                    }
                }
            })
        }
    }
    func hidePopcornGame() {
         popcornCountLabel.isHidden = true
         pCounterImageView.isHidden = true
         basketImageView.isHidden = true
         //kernelImageView.isHidden = true
         showButtonQuestions()
     }
    @objc func movePaddle(_ recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }
    func pong() {
        pingPong.startPongGame()
        skipButton.isHidden = true
        view.addSubview(pingPong.paddle1)
        view.addSubview(pingPong.paddle2)
        view.addSubview(pingPong.ball)
        view.addSubview(pingPong.pongScoreLabel)
        pingPong.paddle2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(BackgroundSelect.movePaddle(_:))))

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        button1.setImage(UIImage(named: "amParkButton"), for: .normal)
        
        button1.imageView?.contentMode = .scaleAspectFit
        
        button2.setImage(UIImage(named: "schoolButton"), for: .normal)
        button2.imageView?.contentMode = .scaleAspectFit
        
        button3.setImage(UIImage(named: "farmButton"), for: .normal)
        button3.imageView?.contentMode = .scaleAspectFit
        
        button1.setTitle(answers[row][0], for: .normal)
        button2.setTitle(answers[row][1], for: .normal)
        button3.setTitle(answers[row][2], for: .normal)
        
        button1.addTarget(self, action: #selector(button1Clicked), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Clicked), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Clicked), for: .touchUpInside)
        
        /*  anywhereButton.backgroundColor = .blue
         self.view.addSubview(self.anywhereButton)
         anywhereButton.addTarget(self, action: #selector(userClickedAnywhere), for: .touchUpInside)*/
        skipButton.frame = CGRect(x: 360, y: 320, width: 190, height: 51)
        skipButton.setTitle("Tap me", for: .normal)
        view.addSubview(skipButton)
        skipButton.addTarget(self, action: #selector(skipClicked), for: .touchUpInside)
    }
    
    let Mainstory : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        
        questionLabel.text = questions[row]
        
        UserAnswers.background = sender.title (for: .normal)!
        
        UserAnswers.character = sender.title (for: .normal)!
        
        UserAnswers.food = sender.title (for: .normal)!
        UserAnswers.game = sender.title (for: .normal)!

        print(UserAnswers.background)
        print(UserAnswers.character)
        print(UserAnswers.food)
        print(UserAnswers.game)


        /*  if userAnswers.character == "dog" {
         showChooseButton1()
         print("character")
         }*/
        
    }
    
    @IBAction func chooseButtonClicked(_ sender: UIButton) {
        row += 1
        print("ROW: \(row)")
        revertAll()
        label1.backgroundColor = nil
        if UserAnswers.background == "Amusement" {
            hideButtonQuestions()
            //    view.addBackground(imageName: amusementPark.imageName, contentMode: .scaleAspectFill)
            showChosenBackground()
            
            showCharacter()
            
            showSpeechBubble()
            
            addMessageToSpeechBubble("Welcome to the " + AmusementPark.name + "!")
            
            promptButton.isHidden = true
            view.addSubview(promptButton)
            showPromptButton(image: UIImage(named: "hello")!, frame: speechBubbleButtonFrame, delay: 7, animation: 0)
        }
        
        if UserAnswers.character == "dog" || UserAnswers.character == "cat" || UserAnswers.character == "cow" {
            hideButtonQuestions()
            view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
            showChosenCharacter()
            showCaptionRect()
            captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
            delayedCaptionWorkItem = DispatchWorkItem {
                self.view.addSubview(self.captionLabel)
                self.captionLabel.adjustsFontSizeToFitWidth = true
                self.captionLabel.numberOfLines = 0
                self.updateCaption("Let's start by having some lunch! Tap the screen to go to the snack shop.")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: delayedCaptionWorkItem!)
        }
        if UserAnswers.food == "pizza" {
            pizzaGame()
            
        }
        if UserAnswers.food == "Hotdog" {
            showHotdogGame()
            hotdogGame()
        }
        if UserAnswers.food == "Popcorn" {
            startPopcornGame()
        }
        if UserAnswers.game == "Ping pong" {
            PingPong().startPongGame()
        }
    }
    
    @IBAction func promptButtonClicked(_ sender: UIButton) {
        count += 1
        print("COUNT: \(count)")
        
        if self.count == 1 {
            
            self.introLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 18)
            self.introLabel.text = "Let's choose a character!"
            self.view.addSubview(self.introLabel)
            self.introLabel.startAnimation(newText: self.introLabel.text ?? "", characterDelay: 0.07)
            
            showPromptButton(image: UIImage(named: "Next button")!, frame: speechBubbleButtonFrame, delay: 3, animation: 1)
        }

        if self.count == 2 {
            self.promptButton.removeTarget(self, action: #selector(self.promptButtonClicked), for: .touchUpInside)
            self.hideIntro()
            self.showButtonQuestions()
            self.goToCharacterSelect()
            let playImage = UIImage(named: "play my story button")
            playMyStoryButton.frame = CGRect(x: 500, y: 150, width: 240, height: 180)
            playMyStoryButton.setImage(playImage, for: .normal)
            //  self.view.addSubview(self.playMyStoryButton)
            playMyStoryButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        }
        
        if self.count == 3 {
            row = 3
            view.addBackground(imageName: "order", contentMode: .scaleAspectFill)
            self.promptButton.isHidden = true
            self.captionRect.isHidden = true
            self.character.isHidden = true
            self.captionLabel.isHidden = true
            hideIntro()
            self.chosenCharacter.isHidden = true
            speechBubble.frame = CGRect(x: 300, y: -200, width: 750, height: 700)
            self.introLabel.isHidden = false
            introLabel.frame = CGRect(x: 540, y: -300, width: 400, height: 800)
            showSpeechBubble()
            addMessageToSpeechBubble("Hi! My name is Bamboo and I will be your server today.")
            self.showPromptButton(image: UIImage(named: "hello")!, frame: self.speechBubbleButtonFrame, delay: 3, animation: 0)
        }

        if self.count == 4 {
            promptButton.isHidden = true
            introLabel.isHidden = true
            self.hideIntro()
            self.showButtonQuestions()
            self.goToFoodSelect()

        }
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        characterAnimation()
        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        self.hideButtonQuestions()
        self.playMyStoryButton.isHidden = true
        storyTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 40)
        storyTitle.textAlignment = .center
        view.addSubview(storyTitle)
        showStoryTitle(Pup.name + "'s Amazing Day at the " + AmusementPark.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dogWalkLeft()
            self.storyTitle.isHidden = true
            self.view.addBackground(imageName: AmusementPark.imageName, contentMode: .scaleAspectFill)
            self.showCaptionRect()
            self.captionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
            self.view.addSubview(self.captionLabel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.updateCaption(Pup.name + " had an amazing day at the " + AmusementPark.name + "!")
            }
        }
        
    }
    
    @IBAction func skipClicked(_ sender: UIButton) {
        print("lol")
       // self.count = 4
       // print(count)
        hideButtonQuestions()
        pong()
       // startPopcornGame()
    }
    
    @IBAction func button1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            switch self.currentAnimation {
            case 0:
                self.button2.transform = .identity
                self.button3.transform = .identity
                self.button1.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        
        showChooseButton()
    }
    
    @IBAction func button2Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                self.button1.transform = .identity
                self.button3.transform = .identity
                self.button2.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        showChooseButton()
    }
    
    @IBAction func button3Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            switch self.currentAnimation {
            case 0:
                self.button2.transform = .identity
                self.button1.transform = .identity
                self.button3.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            default:
                break
            }
        })
        
        showChooseButton()
    }
    
    @IBAction func userClickedAnywhere(_ sender: Any) {
        print("User Clicked Anywhere ROW: \(row)")
        character.layer.removeAllAnimations()
        showSpeechBubbleWorkItem?.perform()
        showSpeechBubbleWorkItem?.cancel()
        speechBubble.layer.removeAllAnimations()
        addMessageToSpeechBubbleWorkItem?.perform()
        addMessageToSpeechBubbleWorkItem?.cancel()
        introLabel.stopAnimation()
        showPromptButtenWorkItem?.perform()
        showPromptButtenWorkItem?.cancel()
        captionRect.layer.removeAllAnimations()
        captionLabel.stopAnimation()
        delayedCaptionWorkItem?.perform()
        delayedCaptionWorkItem?.cancel()
        revertAll()
        let captionText = "Let's order some food!"
        if row == 2 && captionLabel.text != captionText {
            view.addBackground(imageName: "snackShop", contentMode: .scaleAspectFill)
            updateCaption(captionText)
            showPromptButton(image: UIImage(named: "go button")!, frame: captionButtonFrame, delay: 2, animation: 2)
        }
        chooseButton.isHidden = true
    }
    
}

struct UserAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
    static var game = ""
}

struct AmusementPark {
    static var name = "Amusement Park"
    static var imageName = "amusement2"
    
}

struct School {
    static var name = "School"
    static var imageName = "school"
}

struct Farm {
    static var name = "Farm"
    static var imageName = "farm"
}

struct Pup {
    static var name = "Pup"
    static var imageName = "dog"
}

struct Whiskers {
    static var name = "Whiskers"
    static var imageName = "cat"
}

struct Bessie {
    static var name = "Bessie"
    static var imageName = "cow"
}

struct Pizza {
    static var name = "pizza"
    static var imageName = "pizza"
}

struct Hotdog {
    static var name = "hotdog"
    static var imageName = "hotdog"
}

struct Popcorn {
    static var name = "popcorn"
    static var imageName = "popcorn"
}

