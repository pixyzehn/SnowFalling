//
//  ViewController.swift
//  SnowFalling
//
//  Created by pixyzehn on 2/10/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var sfv: SnowFallingView = SnowFallingView(frame: CGRectMake(0, 0, view.frame.size.width*2, view.frame.size.height*2))
        sfv.flakesCount = 400
        view.addSubview(sfv)
        sfv.letItSnow()
    }

}

