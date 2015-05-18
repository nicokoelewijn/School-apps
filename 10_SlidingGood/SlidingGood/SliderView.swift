//
//  SliderView.swift
//  SlidingGood
//
//  Created by Nico Koelewijn on 25/02/15.
//  Copyright (c) 2015 Donut Enterprise. All rights reserved.
//

import UIKit

class SliderView: UIView {

    let scrollView:UIScrollView
    
    override init(frame: CGRect) {
        self.scrollView = UIScrollView(frame: frame)
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.redColor()
        
        self.scrollView.backgroundColor = UIColor.blueColor()
        self.addSubview(self.scrollView)
        
        createImageViews()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createImageViews() {

        var xPosition = 0;
        
        for index in 1...6 {
            let image       = UIImage(named: String(index) )
            let imageView   = UIImageView(image: image)
        
            imageView.frame = CGRectMake( CGFloat(xPosition), 0, image!.size.width, image!.size.height)
            
            
            self.scrollView.addSubview(imageView)

            xPosition += Int(image!.size.width)
            
            self.scrollView.contentSize = CGSize(width: xPosition, height: 0)
            self.scrollView.pagingEnabled = true
            
            
        }
    }

}
