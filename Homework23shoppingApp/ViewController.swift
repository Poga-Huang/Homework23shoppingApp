//
//  ViewController.swift
//  Homework23shoppingApp
//
//  Created by 黃柏嘉 on 2021/11/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var animateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1) {
            self.animateImage.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        } completion: { (finished) in
            UIView.animate(withDuration: 2) {
                self.animateImage.transform = CGAffineTransform(scaleX: 1000, y: 1000)
                self.animateImage.alpha = 0
            } completion: { (finished) in
                UIView.animate(withDuration: 2) {
                    self.logoView.alpha = 1
                    self.logoView.transform = CGAffineTransform(scaleX: 3, y: 3)
                    self.logoView.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { (finished) in
                    self.dismiss(animated: true, completion: nil)
                    self.performSegue(withIdentifier: "endLaunchScreen", sender: nil)
                }

            }
        }

        

        
        
    }


}

