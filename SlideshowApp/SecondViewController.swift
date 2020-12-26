//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by takashimakenichi on 2020/12/26.
//  Copyright © 2020 takashimakenichi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView2: UIImageView!
    var photoName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //print(photoName)
        
        let image = UIImage(named: photoName)
        imageView2.image = image

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
