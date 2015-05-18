//
//  View.swift
//  core_animation
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class View: UIView {

//    var vierkant:CAShapeLayer!
    var photoLayer:CALayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()

//        self.vierkant = CAShapeLayer()
//        self.vierkant.path = UIBezierPath(rect: CGRectMake(0, 0, 100, 100)).CGPath
//        self.vierkant.fillColor = UIColor.redColor().CGColor
//        self.layer.addSublayer(self.vierkant)

        
        let image = UIImage(named: "ryan")
        if let loadedImage = image {
        
            self.photoLayer = CALayer()
            self.photoLayer.contents = image?.CGImage
            self.photoLayer.bounds = CGRectMake(0, 0, loadedImage.size.width, loadedImage.size.height)
            self.photoLayer.position = self.center
            self.layer.addSublayer(self.photoLayer)
            
            
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touches began")
        let touch = touches.first as? UITouch
        let location = touch!.locationInView(self)
        
        if let thePhotoLayer = photoLayer.hitTest(location){
            thePhotoLayer.opacity = 0
        }
    }


}
