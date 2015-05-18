//
//  DaModel.swift
//  notifications
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class DaModel: NSObject {

    var naam:String? {
    
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName("NAAM_CHANGED", object: self)
        }
    }
    
    override init(){
        super.init()
    }
    
}
