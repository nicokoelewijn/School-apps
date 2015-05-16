//
//  MyView.swift
//  LookingGood
//
//  Created by Nico Koelewijn on 07/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class MyView: UIView {

    let imageView:UIImageView
    let btnLeft: UIButton
    let btnRight: UIButton
    
    override init(frame: CGRect) {
        let imageButtonLeft = UIImage(named: "btnLeft")
        let imageButtonRight = UIImage(named: "btnRight")

        btnLeft = UIButton(frame: CGRectMake(0, 0, imageButtonLeft!.size.width, imageButtonLeft!.size.height))
        btnRight = UIButton(frame: CGRectMake(0, 0, imageButtonRight!.size.width, imageButtonRight!.size.height))
        
        let image = UIImage(named: "1")
        self.imageView = UIImageView(image: image)
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
        
        btnLeft.setBackgroundImage(imageButtonLeft, forState: UIControlState.Normal)
        btnRight.setBackgroundImage(imageButtonRight, forState: UIControlState.Normal)
        
        btnLeft.center = CGPointMake(30, self.frame.size.height/2)
        btnRight.center = CGPointMake(self.frame.size.width-30, self.frame.size.height/2)
        self.addSubview(self.imageView)
        self.addSubview(btnLeft)
        self.addSubview(btnRight)
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
