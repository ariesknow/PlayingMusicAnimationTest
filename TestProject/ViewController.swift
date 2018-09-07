//
//  ViewController.swift
//  TestProject
//
//  Created by 辻 悠一郎 on 2018/09/05.
//  Copyright © 2018年 辻 悠一郎. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baseView: UIView!
    
    let animLayer = CALayer() // the layer that is going to be animated
    let secondAnimLayer = CALayer()
    let thirdAnimLayer = CALayer()
    let forthAnimLayer = CALayer()
    
    let heightAnim = CABasicAnimation(keyPath: "bounds.size.height") // the height animation
    let secondHeightAnim = CABasicAnimation(keyPath: "bounds.size.height")
    let thirdHeightAnim = CABasicAnimation(keyPath: "bounds.size.height")
    let forthHeightAnim = CABasicAnimation(keyPath: "bounds.size.height")

    let animDuration = TimeInterval(0.5) // the duration of one 'segment' of the animation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = baseView.frame
        let widthMargin: CGFloat = 11
        let widthSpace: CGFloat = 2
        let heightPosition = (rect.height/3) * 2
        let widthSize: CGFloat = 4
        let heightSize: CGFloat = 4
        
        animLayer.backgroundColor = UIColor.white.cgColor // color of the layer, feel free to change
        animLayer.frame = CGRect(x: widthMargin+widthSize*0.5, y: heightPosition, width: widthSize, height: heightSize)
        animLayer.anchorPoint = CGPoint(x: 1, y: 1) // sets so that when the width is changed, it goes to the left
        
        secondAnimLayer.backgroundColor = UIColor.white.cgColor
        secondAnimLayer.frame = CGRect(x: animLayer.position.x+widthSpace+(widthSize*0.5), y: heightPosition, width: widthSize, height: heightSize)
        secondAnimLayer.anchorPoint = CGPoint(x: 1, y: 1)
        
        thirdAnimLayer.backgroundColor = UIColor.white.cgColor
        thirdAnimLayer.frame = CGRect(x: secondAnimLayer.position.x+widthSpace+(widthSize*0.5), y: heightPosition, width: widthSize, height: heightSize)
        thirdAnimLayer.anchorPoint = CGPoint(x: 1, y: 1)
        
        forthAnimLayer.backgroundColor = UIColor.white.cgColor
        forthAnimLayer.frame = CGRect(x: thirdAnimLayer.position.x+widthSpace+(widthSize*0.5), y: heightPosition, width: widthSize, height: heightSize)
        forthAnimLayer.anchorPoint = CGPoint(x: 1, y: 1)
        
        baseView.layer.addSublayer(animLayer)
        baseView.layer.addSublayer(secondAnimLayer)
        baseView.layer.addSublayer(thirdAnimLayer)
        baseView.layer.addSublayer(forthAnimLayer)
        
        heightAnim.duration = animDuration
        heightAnim.fromValue = animLayer.frame.size.height
        heightAnim.toValue = rect.height/3
        heightAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        heightAnim.repeatDuration = .infinity
        heightAnim.autoreverses = true
        
        secondHeightAnim.duration = animDuration * 1.1
        secondHeightAnim.fromValue = secondAnimLayer.frame.size.height
        secondHeightAnim.toValue = rect.height/3
        secondHeightAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        secondHeightAnim.repeatDuration = .infinity
        secondHeightAnim.autoreverses = true
        
        thirdHeightAnim.duration = animDuration * 0.9
        thirdHeightAnim.fromValue = thirdAnimLayer.frame.size.height
        thirdHeightAnim.toValue = rect.height/3
        thirdHeightAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        thirdHeightAnim.repeatDuration = .infinity
        thirdHeightAnim.autoreverses = true
        
        forthHeightAnim.duration = animDuration * 1.05
        forthHeightAnim.fromValue = forthAnimLayer.frame.size.height
        forthHeightAnim.toValue = rect.height/3
        forthHeightAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        forthHeightAnim.repeatDuration = .infinity
        forthHeightAnim.autoreverses = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("start")
        animLayer.add(heightAnim, forKey: "heightAnim")
        secondAnimLayer.add(secondHeightAnim, forKey: "secondeHeightAnim")
        thirdAnimLayer.add(thirdHeightAnim, forKey: "thirdHeightAnim")
        forthAnimLayer.add(forthHeightAnim, forKey: "forthHeightAnim")
    }
    
    @IBAction func stop(_ sender: UIButton) {
        print("stop")
        animLayer.removeAllAnimations()
        secondAnimLayer.removeAllAnimations()
        thirdAnimLayer.removeAllAnimations()
        forthAnimLayer.removeAllAnimations()
    }
}

