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
    
    class func createFromJSONData(data:NSData) -> Array<StudentData>{
        var json = JSON(data:data)
        var studentsArray = Array<StudentData>()

        for (index: String, subJson: JSON) in json {
            let name = subJson["name"]
            let dateOfBirthString = subJson["dateOfBirth"]
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateOfBirth = dateFormatter.dateFromString(dateOfBirthString.stringValue)
            let photoFileName = subJson["photoFileName"]
            let regular = subJson["regular"]
            let studentData = StudentData(name: name.stringValue, dateOfBirth: dateOfBirth!, regular: regular.boolValue, photoFileName: photoFileName.stringValue)
            
            studentsArray.append(studentData)
        }
        return studentsArray
    }
}
