//
//  DatesOverviewTableViewController.swift
//  SaveTheDate
//
//  Created by Frederik Jacques on 21/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

class DatesOverviewTableViewController: UITableViewController, AddDateTableViewControllerDelegate {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var students:[Student]
    
    var fileName:String{
        
        get {
            
            let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
            return documentPath.stringByAppendingPathComponent("dates.devine")
            
        }
        
    }
    
    // MARK: - Initializers methods
    init() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let theFile = documentsPath.stringByAppendingPathComponent("dates.devine")
        
        if let loadedFile = NSKeyedUnarchiver.unarchiveObjectWithFile(theFile) as? [Student] {
            students = loadedFile
        } else {
            students = [Student]()
        }
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dates"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addDateButtonTouched:")
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "dateCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

        
    }
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    func addDateButtonTouched( sender:UIBarButtonItem ) {
    
        println("[DateOverviewVC] Add date button touched")
        
        let addDateVC = AddDateTableViewController(style: UITableViewStyle.Grouped)
        addDateVC.delegate = self
        
        let navVC = UINavigationController(rootViewController: addDateVC)
        presentViewController( navVC, animated: true, completion: nil)
        
    }
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    // MARK: - UITableViewControllerDatasource methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        // Return the number of sections.
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Return the number of rows in the section.
        return students.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath: indexPath) as! UITableViewCell
    
        // Configure the cell...
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        
        return cell
    }
    
    
    // MARK: - Delegate methods
    // MARK: AddDateTableViewControllerDelegate methods
    func addDateTableViewController(viewController: AddDateTableViewController, saveDateWithName name: String) {
        
        println("saveDateWithName (delegate)")
        
        let student = Student(name: name)
        students.append(student)
        
        if NSKeyedArchiver.archiveRootObject(students, toFile: fileName){
            println("succesvol opgeslagen")
        } else {
            println("faal")
        }
        
        tableView.reloadData()
        
        viewController.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
    }
    
}
