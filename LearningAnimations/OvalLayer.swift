//
//  OvalLayer.swift
//  LearningAnimations
//
//  Created by absin on 12/20/17.
//  Copyright © 2017 absin.io. All rights reserved.
//
import UIKit

class OvalLayer: CAShapeLayer {
    let animationDuration: CFTimeInterval = 5
    override init() {
        super.init()
        fillColor = UIColor.red.cgColor
        path = ovalSmallPath.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ovalSmallPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0, height: 0))
    }
    
    var ovalLargePath: UIBezierPath{
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    var ovalPathSquishVertical: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    
    var ovalPathSquishHorizontal: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    func expand(){
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalSmallPath.cgPath
        expandAnimation.toValue = ovalLargePath.cgPath
        expandAnimation.duration  = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    
    func wobble(){
        
    }
    
    func contract() {
        
    }
}

