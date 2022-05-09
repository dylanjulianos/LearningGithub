//
//  ViewController.swift
//  CircularProgress-Tutorial
//
//  Created by Dylan Juliano Santoso on 28/04/22.
//

import UIKit

class ViewController: UIViewController {

    let shape = CAShapeLayer()
    var progress: Float = 0.0

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CIRCULAR PROGRESS BAR
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: (.pi * 3 / 2), clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 30
        shape.strokeColor = UIColor.yellow.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        
        //PROGRESS BAR
        progress += 1/8
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.toValue = progress
        animation.duration = 1 //progress bar' speed
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
        print("worked")
        
        if progress >= 1.0{
            addButton.isEnabled = false
            addButton.backgroundColor = UIColor .gray
        }
        
    }

}

