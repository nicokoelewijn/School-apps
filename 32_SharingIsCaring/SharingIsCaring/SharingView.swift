//
//  SharingView.swift
//  SharingIsCaring
//
//  Created by Frederik Jacques on 06/05/15.
//  Copyright (c) 2015 devine. All rights reserved.
//

import UIKit

class SharingView: UIView {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var imageView:UIImageView!
    
    // MARK: - Initializers methods
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        createImageView()
    }
        
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    func createImageView(){
        
        imageView = UIImageView(image: UIImage(named: "background"))
        addSubview(imageView)
        
    }
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
    

}
