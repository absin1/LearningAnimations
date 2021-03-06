//
//  TriangleLayer.swift
//  LearningAnimations
//
//  Created by absin on 12/21/17.
//  Copyright © 2017 absin.io. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
    let innerPadding: CGFloat = 30.0
    
    override init() {
        super.init()
        fillColor = UIColor.blue.cgColor
        strokeColor = UIColor.cyan.cgColor
        lineWidth = 7.0
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code: ) has not been implemented")
    }
    
    var trianglePathSmall: UIBezierPath {
        var trianglepath = UIBezierPath()
        trianglepath.move(to: CGPoint(x: 5.0+innerPadding, y: 95.0))
        trianglepath.addLine(to: CGPoint(x: 50.0, y: 12.5+innerPadding))
        trianglepath.addLine(to: CGPoint(x: 95.0-innerPadding, y: 95.0))
        trianglepath.close()
        return trianglepath
    }
    
    var trianglePathLeftExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5+innerPadding))
        trianglePath.addLine(to: CGPoint(x: 95.0-innerPadding, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    var trianglePathRightExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 23.5+innerPadding))
        trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    var trianglePathTopExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5))
        trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    func animate(){
        var triangleAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationLeft.fromValue = trianglePathSmall.cgPath
        triangleAnimationLeft.toValue = trianglePathLeftExtension.cgPath
        triangleAnimationLeft.beginTime = 0.0
        triangleAnimationLeft.duration = 0.3
        
        var triangleAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationRight.fromValue = trianglePathLeftExtension.cgPath
        triangleAnimationRight.toValue = trianglePathRightExtension.cgPath
        triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration
        triangleAnimationRight.duration = 0.25
        
        var triangleAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationTop.fromValue = trianglePathRightExtension.cgPath
        triangleAnimationTop.toValue = trianglePathTopExtension.cgPath
        triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration
        triangleAnimationTop.duration = 0.20
        
        var triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        triangleAnimationGroup.animations = [triangleAnimationLeft, triangleAnimationRight,
                                             triangleAnimationTop]
        triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.isRemovedOnCompletion = false
        add(triangleAnimationGroup, forKey: nil)
    }
}
