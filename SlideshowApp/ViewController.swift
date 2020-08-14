//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 井上幹太 on 2020/08/09.
//  Copyright © 2020 Kanta Inoue. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var SlideShow: UIImageView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    
    var imageIndex:Int = 0
    // タイマー
    var timer: Timer!

    let images = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3")]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let imageView = images[0]
        SlideShow.image = imageView
    }
    // 進むボタン IBAction
    @IBAction func nextButton(_ sender: Any) {
        if  imageIndex == 2 {
            imageIndex = 0
        }else{
            imageIndex += 1
        }
            SlideShow.image = images[imageIndex]
    }
   // 戻るボタン IBAction
      @IBAction func backButton(_ sender: Any) {
        // 0に達したら2に移動する
      if  imageIndex == 0 {
          imageIndex = 2
        // それ以外は、1づつ減少
      }else{
          imageIndex -= 1
      }
          SlideShow.image = images[imageIndex]
      }
    // 再生/停止ボタン
    @IBAction func startStopButton(_ sender: Any) {
        if(timer == nil){
              //　開始時の処理
            timer = Timer.scheduledTimer(timeInterval:  2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startStopButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }else{
              // 停止時の処理
            timer.invalidate()
            timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            startStopButton.setTitle("再生", for: .normal)
        }
    }
        @objc func changeImage(){
              imageIndex += 1
                  if(imageIndex == 3){
                      imageIndex = 0
                  }
                  SlideShow.image = images[imageIndex]
        }
    
    @IBAction func tapButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tapButtonViewController:ResultViewController = segue.destination as! ResultViewController
        
        tapButtonViewController.image = self.images[imageIndex]
        timer.invalidate()
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}
