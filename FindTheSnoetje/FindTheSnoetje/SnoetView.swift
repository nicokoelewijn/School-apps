//
//  SnoetView.swift
//  FindTheSnoetje
//
//  Created by Frederik Jacques on 05/05/15.
//  Copyright (c) 2015 devine. All rights reserved.
//

import UIKit

class SnoetView: UIView {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var imageView:UIImageView!
    var detectFacesButton:UIButton!
    
    // MARK: - Initializers methods
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createImageView()
        createDetectFacesButton()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    func createImageView(){
    
        imageView = UIImageView(image: UIImage(named: "baby"))
        addSubview(imageView)
                
    }
    
    func createDetectFacesButton(){
        
        detectFacesButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        detectFacesButton.setTitle("Detect snoetjes", forState: UIControlState.Normal)
        detectFacesButton.frame = CGRect(x: 0, y: 0, width: 150, height: 44)
        detectFacesButton.center = CGPoint(x: center.x, y: imageView.center.y + (imageView.bounds.size.height / 2) + 20 )
        addSubview(detectFacesButton)
        
    }
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
    
    
    
    
}
