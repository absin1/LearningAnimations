//
//  OvalLayer.swift
//  LearningAnimations
//
//  Created by absin on 12/20/17.
//  Copyright © 2017 absin.io. All rights reserved.
//
import UIKit

class OvalLayer: CAShapeLayer {
    let animationDuration: CFTimeInterval = 0.3
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
        var expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalSmallPath.cgPath
        expandAnimation.toValue = ovalLargePath.cgPath
        expandAnimation.duration  = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    
    func wobble(){
        var wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation1.fromValue = ovalLargePath.cgPath
        wobbleAnimation1.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        var wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation2.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation2.toValue = ovalPathSquishHorizontal.cgPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime+animationDuration
        wobbleAnimation2.duration = animationDuration
        
        var wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation3.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation3.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime+animationDuration
        wobbleAnimation3.duration = animationDuration
        
        var wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation4.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation4.toValue = ovalLargePath.cgPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime+animationDuration
        wobbleAnimation4.duration = animationDuration
        
        var wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        wobbleAnimationGroup.animations = [wobbleAnimation1,wobbleAnimation2,wobbleAnimation3,wobbleAnimation4]
        wobbleAnimationGroup.duration   = wobbleAnimation4.beginTime+animationDuration
        wobbleAnimationGroup.repeatCount = 2
        add(wobbleAnimationGroup, forKey: nil)
    }
    
    func contract() {
        
    }
}

