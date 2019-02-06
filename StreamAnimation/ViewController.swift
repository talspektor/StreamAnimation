//
//  ViewController.swift
//  StreamAnimation
//
//  Created by user140592 on 2/4/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }

    @objc private func handleTap() {
        (0...10).forEach { (_) in
            generateAnimate()
        }
    }
    
    private func generateAnimate() {
        let image = drand48() > 0.5 ? UIImage(named: "like-2") : UIImage(named: "like")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }

}

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    
    path.move(to: CGPoint(x: 0, y: 200))
    
    let endPath = CGPoint(x: 500, y: 200)
    
    let randomYShift = 200 + drand48() * 300
    let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
    let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
    path.addCurve(to: endPath, controlPoint1: cp1, controlPoint2: cp2)
    return path
}

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = customPath()
        
        path.lineWidth = 3
        path.stroke()
    }
}

