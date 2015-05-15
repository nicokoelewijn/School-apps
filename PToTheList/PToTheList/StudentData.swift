//
//  StudentData.swift
//  PToTheList
//
//  Created by Nico Koelewijn on 11/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class StudentData: NSObject {
    let name:String
    let dateOfBirth:NSDate
    let regular:Bool
    let photoFileName:String
    
    init(name:String, dateOfBirth:NSDate, regular:Bool, photoFileName:String){
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.regular = regular
        self.photoFileName = photoFileName
    }
    
    override var description:String{
        return "[StudentData] \(name), \(dateOfBirth), \(regular), \(photoFileName)"
    }
}
