//
//  SnowFallingView.swift
//  SnowFalling
//
//  Created by pixyzehn on 2/11/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

let kDefaultFlakesCount                 = 200
let kDefaultFlakeWidth: Float           = 40.0
let kDefaultFlakeHeight: Float          = 46.0
let kDefaultFlakeFileName               = "snowflake.png"
let kDefaultMinimumSize: Float          = 0.4
let kDefaultAnimationDurationMin: Float = 6.0
let kDefaultAnimationDurationMax: Float = 12.0

class SnowFallingView: UIView {
    
    var flakesCount: Int?
    var flakeFileName: String?
    var flakeWidth: Float?
    var flakeHeight: Float?
    var flakeMinimumSize: Float?
    
    var animationDurationMin: Float?
    var animationDurationMax: Float?
    
    var flakesArray: [String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds             = true
        self.flakesCount          = kDefaultFlakesCount
        self.flakeFileName        = kDefaultFlakeFileName
        self.flakeWidth           = kDefaultFlakeWidth
        self.flakeHeight          = kDefaultFlakeHeight
        self.flakeMinimumSize     = kDefaultMinimumSize
        self.animationDurationMin = kDefaultAnimationDurationMin
        self.animationDurationMax = kDefaultAnimationDurationMax
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createFlakes() {
        
    }
    
    func letItSnow() {
        
    }
    
    deinit {
        
    }
}
