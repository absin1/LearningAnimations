//
//  ViewController.swift
//  LearningAnimations
//
//  Created by absin on 12/20/17.
//  Copyright © 2017 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
    var holderView: HolderView = HolderView(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width/2-boxSize/2, y: view.bounds.height/2-boxSize/2, width: boxSize, height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.addOval()
    }
    
    func animateLabel() {
        
    }
}

