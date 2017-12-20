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
    let ovalLayer = OvalLayer()
    var parentFrame :CGRect = CGRect.zero
    var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
    }
}

