//
//  PhotoboothPicture.swift
//  StoryMaker
//
//  Created by Marina Lee on 7/24/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class PhotoboothPicture: UIViewController {
    
    
    @IBOutlet weak var photoBG: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoBG.image = UIImage(named: UserAnswers.photo)
    }
}
