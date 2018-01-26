//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Uchenna  Aguocha on 1/26/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let's start by drawing a circle somehow
        let shapeLayer = CAShapeLayer()
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }

    @objc private func handleTap() {
        print("Attempting to animate stroke")
    }

}
