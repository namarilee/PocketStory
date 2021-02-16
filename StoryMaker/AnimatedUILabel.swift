//
//  AnimatedUILabel.swift
//  StoryMaker
//
//  Created by Marina Lee on 1/3/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import UIKit

class AnimatedUILabel: UILabel {
    
    private var newText: String?
    private var workItems = [DispatchWorkItem]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startAnimation(newText: String, characterDelay: TimeInterval) {
        self.newText = newText
        text = ""
        isHidden = false
        for (index, character) in newText.enumerated() {
            let workItem = DispatchWorkItem {
                self.text?.append(character)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index), execute: workItem)
            workItems.append(workItem)
        }
    }
    
    func stopAnimation() {
        for workItem in workItems {
            workItem.cancel()
        }
        text = newText
    }
}
