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
let kDefaultFlakeFileName               = "snowflake"
let kDefaultMinimumSize: Float          = 0.4
let kDefaultMaximumSize: Float          = 0.8
let kDefaultAnimationDurationMin: Float = 6.0
let kDefaultAnimationDurationMax: Float = 12.0

class SnowFallingView: UIView {
    
    var flakesCount: Int?
    var flakeFileName: String?
    var flakeWidth: Float?
    var flakeHeight: Float?
    var flakeMinimumSize: Float?
    var flakeMaximumSize: Float?
    
    var animationDurationMin: Float?
    var animationDurationMax: Float?
    
    var flakesArray: [UIImageView]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds             = true
        self.flakesCount          = kDefaultFlakesCount
        self.flakeFileName        = kDefaultFlakeFileName
        self.flakeWidth           = kDefaultFlakeWidth
        self.flakeHeight          = kDefaultFlakeHeight
        self.flakeMinimumSize     = kDefaultMinimumSize
        self.flakeMaximumSize     = kDefaultMaximumSize
        self.animationDurationMin = kDefaultAnimationDurationMin
        self.animationDurationMax = kDefaultAnimationDurationMax
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createFlakes() {
        flakesArray = [UIImageView]()
        var flakeImage: UIImage = UIImage(named: flakeFileName!)!
        for var i: Int = 0; i < flakesCount!; i++ {
            var vz: Float = 1.0 * Float(rand()) / Float(RAND_MAX)
            vz = vz < flakeMinimumSize! ? flakeMinimumSize! : vz
            vz = vz > flakeMaximumSize! ? flakeMaximumSize! : vz
            
            var vw = flakeWidth! * vz
            var vh = flakeHeight! * vz
            
            var vx = Float(frame.size.width) * Float(rand()) / Float(RAND_MAX)
            var vy = Float(frame.size.height) * 1.5 * Float(rand()) / Float(RAND_MAX)
            
            vy += Float(frame.size.height)
            vx -= vw
            
            var imageFrame = CGRectMake(CGFloat(vx), CGFloat(vy), CGFloat(vw), CGFloat(vh))
            var imageView: UIImageView = UIImageView(image: flakeImage)
            imageView.frame = imageFrame
            imageView.userInteractionEnabled = false
            flakesArray?.append(imageView)
            addSubview(imageView)
        }
    }
    
    func startSnow() {
        if flakesArray? == nil {
            createFlakes()
        }
        backgroundColor = UIColor.clearColor()
        
        var rotAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotAnimation.repeatCount = Float.infinity
        rotAnimation.autoreverses = false
        rotAnimation.toValue = 6.28318531
        
        var theAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        theAnimation.repeatCount = Float.infinity
        theAnimation.autoreverses = false
        
        for v: UIImageView in flakesArray! {
            var p: CGPoint = v.center
            let startypos = p.y
            let endypos = frame.size.height
            p.y = endypos
            v.center = p
            var timeInterval: Float = (animationDurationMax! - animationDurationMin!) * Float(rand()) / Float(RAND_MAX)
            theAnimation.duration = CFTimeInterval(timeInterval + animationDurationMin!)
            theAnimation.fromValue = -startypos
            v.layer.addAnimation(theAnimation, forKey: "transform.translation.y")
            
            rotAnimation.duration = CFTimeInterval(timeInterval)
            v.layer.addAnimation(rotAnimation, forKey: "transform.rotation.y")
        }
    }
    
    func stopSnow() {
        for v: UIImageView in flakesArray! {
            v.layer.removeAllAnimations()
        }
        flakesArray = nil
    }
    
    deinit {
    }
}
