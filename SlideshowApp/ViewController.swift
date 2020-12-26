//
//  ViewController.swift
//  SlideshowApp
//
//  Created by takashimakenichi on 2020/12/26.
//  Copyright © 2020 takashimakenichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    // 表示画像の番号
    var numberOfPhoto = 0
    let imageArray = ["meal1.jpeg", "meal2.jpeg", "meal3.jpeg"]
    
    var timer: Timer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先のviewController取得
        let secondViewController = segue.destination as! SecondViewController
        
        // 現在表示中の画像
        let photoName = imageArray[numberOfPhoto]

        // 遷移先のプロパティに設定
        secondViewController.photoName = photoName
        
        // 遷移時にスライドショー停止する
        nextBtn.isEnabled = true
        backBtn.isEnabled = true
        playBtn.setTitle("再生", for: .normal)
        
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

    @IBAction func nextButton(_ sender: UIButton) {
        numberOfPhoto += 1
        if numberOfPhoto >= imageArray.count {
            numberOfPhoto = 0
        }
        
        showImage(numberOfPhoto: numberOfPhoto)
        
//        let photoName = imageArray[numberOfPhoto]
//        let image = UIImage(named: photoName)
//        imageView.image = image
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        numberOfPhoto -= 1
        if numberOfPhoto < 0 {
            numberOfPhoto = imageArray.count - 1
        }
        
        showImage(numberOfPhoto: numberOfPhoto)
        
//        let photoName = imageArray[numberOfPhoto]
//        let image = UIImage(named: photoName)
//        imageView.image = image
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        
        if timer != nil {
            nextBtn.isEnabled = true
            backBtn.isEnabled = true
            playBtn.setTitle("再生", for: .normal)
            
            // タイマー・スライド停止処理
            if timer != nil {
                timer.invalidate()
                timer = nil
            }
            
        } else {
            nextBtn.isEnabled = false
            //nextBtn.isHidden = true
            backBtn.isEnabled = false
            playBtn.setTitle("停止", for: .normal)
            
            // タイマー・スライド開始処理
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    @objc func slideshow(_ timer: Timer) {
        numberOfPhoto += 1
        if numberOfPhoto >= imageArray.count {
            numberOfPhoto = 0
        }
        
        showImage(numberOfPhoto: numberOfPhoto)
        
//        let photoName = imageArray[numberOfPhoto]
//        let image = UIImage(named: photoName)
//        imageView.image = image
    }
    
    
    func showImage(numberOfPhoto: Int) {
        let photoName = imageArray[numberOfPhoto]
        let image = UIImage(named: photoName)
        
        imageView.image = image
    }
    
    
    
    
}

