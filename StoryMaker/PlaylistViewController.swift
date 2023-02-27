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
            ViewController.instance.pauseSound()
            showPausedImage(image: UIImage(named: "themeSongPaused")!)
        }
        if playlistImageView.currentImage == UIImage(named: "themeSongPaused") && countClick % 2 != 0 {
            
            ViewController.instance.playSound(soundFile: "Eb ")
            showPlayImage(image: UIImage(named: "themeSongPlaying")!)
        }
        if playlistImageView.currentImage == UIImage(named: "parkSongPlaying") {
                  ViewController.instance.pauseSound()
                  showPausedImage(image: UIImage(named: "parkSongPaused")!)
        }
        if playlistImageView.currentImage == UIImage(named: "parkSongPaused") && countClick % 2 != 0 {
                  
                  ViewController.instance.playSound(soundFile: "dixielandost (1)")
                  showPlayImage(image: UIImage(named: "parkSongPlaying")!)
        }
        if playlistImageView.currentImage == UIImage(named: "snackSongPlaying") {
                  ViewController.instance.pauseSound()
                  showPausedImage(image: UIImage(named: "snackSongPaused")!)
        }
        if playlistImageView.currentImage == UIImage(named: "snackSongPaused") && countClick % 2 != 0 {
                  
                  ViewController.instance.playSound(soundFile: "foodcourtost")
                  showPlayImage(image: UIImage(named: "snackSongPlaying")!)
        }
        if playlistImageView.currentImage == UIImage(named: "photoSongPlaying") {
                ViewController.instance.pauseSound()
                showPausedImage(image: UIImage(named: "photoSongPaused")!)
               }
        if playlistImageView.currentImage == UIImage(named: "photoSongPaused") && countClick % 2 != 0 {
                         
                         ViewController.instance.playSound(soundFile: "Bb major_1")
                         showPlayImage(image: UIImage(named: "photoSongPlaying")!)
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
    
    @IBAction func parkSongClicked(_ sender: UIButton) {
        animateButton(sender)
        animateButton(playlistImageView)
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "dixielandost (1)")
        playlistImageView.setImage(UIImage(named: "parkSongPlaying"), for: .normal)

    }
    
    
    @IBAction func snackSongClicked(_ sender: UIButton) {
        animateButton(sender)
        animateButton(playlistImageView)
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "foodcourtost")
        playlistImageView.setImage(UIImage(named: "snackSongPlaying"), for: .normal)
    }
    
    @IBAction func photoSongClicked(_ sender: UIButton) {
        animateButton(sender)
        animateButton(playlistImageView)
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "Bb major_1")
        playlistImageView.setImage(UIImage(named: "photoSongPlaying"), for: .normal)
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
    
    
    @IBAction func backTapped(_ sender: Any) {
        ViewController.instance.pauseSound()
        ViewController.instance.playSound(soundFile: "Eb ")
    }
}
