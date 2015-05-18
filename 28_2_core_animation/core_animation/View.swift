//
//  View.swift
//  core_animation
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class View: UIView {

    var photoLayer:CALayer!
    var maskLayer:CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()

        maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(ovalInRect: CGRectMake(-25, -25, 50, 50)).CGPath
        maskLayer.fillColor = UIColor.whiteColor().CGColor
        maskLayer.position = self.center

        maskLayer.transform = CATransform3DMakeScale(0, 0, 0)
        
        let image = UIImage(named: "pinup")
        if let loadedImage = image {
        
            self.photoLayer = CALayer()
            self.photoLayer.contents = image?.CGImage
            self.photoLayer.bounds = CGRectMake(0, 0, loadedImage.size.width, loadedImage.size.height)
            self.photoLayer.position = self.center
            self.photoLayer.mask = maskLayer
            self.layer.addSublayer(self.photoLayer)
            
            
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touches began")
        maskLayer.transform = CATransform3DMakeScale(1, 1, 0)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("Touched moved")
        let touch = touches.first as? UITouch
        let point = touch!.locationInView(self)
        CATransaction.setDisableActions(true)
        maskLayer.position = point
        CATransaction.setDisableActions(false)
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("Touches ended")
        let touch = touches.first as? UITouch
        maskLayer.transform = CATransform3DMakeScale(0, 0, 0)
    }
}
