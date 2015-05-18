//
//  Student.swift
//  SaveTheDate
//
//  Created by Frederik Jacques on 21/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

class Student: NSObject, NSCoding {
   
    var name:String
    
    init( name:String ) {
        
        self.name = name
        
        super.init()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        println("Encode object")
        aCoder.encodeObject(name, forKey: "name")
    }
    
}
