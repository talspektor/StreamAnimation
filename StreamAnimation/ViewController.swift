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
        
        let curvedView = CurvedView(frame: view.frame)
        curvedView.backgroundColor = .yellow
        
        view.addSubview(curvedView)

        let imageView = UIImageView(image: UIImage(named: "like-2"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2
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
    
    let endPath = CGPoint(x: 400, y: 200)
    
    let cp1 = CGPoint(x: 100, y: 200)
    let cp2 = CGPoint(x: 200, y: 300)
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

