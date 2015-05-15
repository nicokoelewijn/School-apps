//
//  StudentFactory.swift
//  PToTheList
//
//  Created by Nico Koelewijn on 15/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class StudentFactory: NSObject {
    class func createFromArray(plistArray: NSArray )->Array<StudentData>{
        var studentsArray = Array<StudentData>()
        
        for studentDict in plistArray {
            let name = studentDict["name"] as! String
            let dateOfBirth = studentDict["dateOfBirth"] as! NSDate
            let regular = studentDict["regular"] as! Bool
            let photoFileName = studentDict["photoFileName"] as! String
            
            let studentData = StudentData(name: name, dateOfBirth: dateOfBirth, regular: regular, photoFileName: photoFileName)
            //println("studentData: \(studentData)")
            
            studentsArray.append(studentData)
        }
        return studentsArray
    }
}
