//
//  HolderView.swift
//  LearningAnimations
//
//  Created by absin on 12/20/17.
//  Copyright © 2017 absin.io. All rights reserved.
//

import UIKit

protocol HolderViewDelegate {
    func animateLabel()
}

class HolderView: UIView {
    
    // MARK: Properties
    let ovalLayer = OvalLayer()
    let traingleLayer = TriangleLayer()
    
    var parentFrame :CGRect = CGRect.zero
    var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    @objc func addOval() {
        print("Reached addoval")
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
    }
    func wobbleOval(){
        layer.addSublayer(traingleLayer)
        ovalLayer.wobble()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.addOval), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(self.drawAnimatedTriangle), userInfo: nil, repeats: false)
    }
    @objc func drawAnimatedTriangle(){
        print("Reached drawAnimatedTriangle")
        traingleLayer.animate()
    }
}

