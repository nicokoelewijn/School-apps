//
//  SnobImageView.swift
//  SnobChat
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class MyView: UIView {

    var imageView:UIImageView
    var image: UIImage
    
    override init(frame: CGRect) {
        
        self.image = UIImage()
        self.imageView = UIImageView(image: image)
        
        super.init(frame: frame)

        self.addSubview(self.imageView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
