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
        
        println("[Student] Init")
        self.name = name
        
        super.init()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        println("[Student] Decode object")
        name = aDecoder.decodeObjectForKey("name") as! String
        
        super.init()
        
    }
        
    func encodeWithCoder(aCoder: NSCoder) {
        
        println("[Student] Encode object")
        aCoder.encodeObject( name, forKey: "name")

    }
    
    
}
