//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 井上幹太 on 2020/08/11.
//  Copyright © 2020 Kanta Inoue. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image
    }
    
}
