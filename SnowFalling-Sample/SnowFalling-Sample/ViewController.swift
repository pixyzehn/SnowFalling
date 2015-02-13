//
//  ViewController.swift
//  SnowFalling-Sample
//
//  Created by pixyzehn on 2/13/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sfv: SnowFallingView?
    
    enum State {
        case Snowing
        case Stoping
    }
    
    var currentState: State = .Snowing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sfv = SnowFallingView(frame: CGRectMake(0, 0, view.frame.size.width * 2, view.frame.size.height * 2))
        sfv?.flakesCount = 100
        view.addSubview(sfv!)
        sfv?.startSnow()
        
        // Triple tap action
        var tripleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTripleTap")
        tripleTap.numberOfTapsRequired = 3
        view.addGestureRecognizer(tripleTap)
    }
    
    func handleTripleTap() {
        if currentState == .Snowing {
            sfv?.stopSnow()
            currentState = .Stoping
        } else {
            sfv?.startSnow()
            currentState = .Snowing
        }
    }
    
}
