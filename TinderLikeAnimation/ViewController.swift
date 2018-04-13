//
//  ViewController.swift
//  TinderLikeAnimation
//
//  Created by Pavlo Novak on 4/13/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        var rotationAngle: CGFloat
        rotationAngle = -.pi*2*translation.x/1000
        if let view = recognizer.view {
            if abs(translation.y) < 250 && rotationAngle < 1 && rotationAngle > -1 {
                view.transform = CGAffineTransform.identity.rotated(by: rotationAngle).translatedBy(x: 0, y: translation.y)
            }
        }
        if recognizer.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.9, animations: {
                self.myView.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
}

