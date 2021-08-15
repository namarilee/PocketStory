//
//  PlaylistViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 8/15/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PlaylistViewController: UIViewController {
    
    @IBOutlet weak var playlistImageView: UIButton!

    var countClick = 0
    @IBAction func playImageClicked(_ sender: UIButton) {
        countClick += 1
        if playlistImageView.currentImage == UIImage(named: "initialPlaylistView") {
            animateButton(sender)
        }
        if playlistImageView.currentImage == UIImage(named: "themeSongPlaying") {
          //  countClick += 1
            ViewController.instance.pauseSound()
            showPausedImage(image: UIImage(named: "themeSongPaused")!)
        }
        if playlistImageView.currentImage == UIImage(named: "themeSongPaused") && countClick % 2 != 0 {
            
            ViewController.instance.playSound(soundFile: "Eb ")
            showPlayImage(image: UIImage(named: "themeSongPlaying")!)
        }
        print(countClick)
    }
    
    @IBAction func themeSongClicked(_ sender: UIButton) {
        animateButton(sender)
        animateButton(playlistImageView)
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "Eb ")
        playlistImageView.setImage(UIImage(named: "themeSongPlaying"), for: .normal)
    }
    func animateButton(_ buttonToAnimate: UIView) {
              UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                       buttonToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                   }) { (_) in
                       UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                           buttonToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                       }, completion: nil)
                   }
          }
    func showPausedImage(image: UIImage) {
        playlistImageView.setImage(image, for: .normal)
         UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.playlistImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    func showPlayImage(image: UIImage) {
         playlistImageView.setImage(image, for: .normal)
          UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.playlistImageView.transform = .identity
         })
     }
}
