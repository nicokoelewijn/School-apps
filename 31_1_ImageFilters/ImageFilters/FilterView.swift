//
//  FilterView.swift
//  ImageFilters
//
//  Created by Frederik Jacques on 27/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

class FilterView: UIView {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var imageView:UIImageView!
    var btnSepia:UIButton!
    var btnTwirl:UIButton!
    
    // MARK: - Initializers methods
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        createImageView()
        createSepiaButton()
        createTwirlButton()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    func createImageView(){

        imageView = UIImageView(image: UIImage(named: "paris"))
        imageView.center = self.center
        self.addSubview(imageView)
        
    }
    
    func createSepiaButton(){
        
        btnSepia = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnSepia.setTitle("Sepia", forState: UIControlState.Normal)
        btnSepia.frame = CGRect(x: 15, y: 35, width: 50, height: 44)
        addSubview(btnSepia)
        
    }
    
    func createTwirlButton(){
        btnTwirl = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btnTwirl.setTitle("Twirl", forState: UIControlState.Normal)
        btnTwirl.frame = CGRect(x: 15, y: 65, width: 50, height: 44)
        addSubview(btnTwirl)
    }
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
}
