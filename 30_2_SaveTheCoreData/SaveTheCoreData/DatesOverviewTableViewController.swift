//
//  DatesOverviewTableViewController.swift
//  SaveTheDate
//
//  Created by Frederik Jacques on 21/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit
import CoreData

class DatesOverviewTableViewController: UITableViewController, AddDateTableViewControllerDelegate {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var dates = [NSManagedObject]()
    var appDelegate:AppDelegate{
        get{
            return UIApplication.sharedApplication().delegate as! AppDelegate
        }
    }

    
    // MARK: - Initializers methods
    init() {
        
        let fetchRequest = NSFetchRequest(entityName: "Date")
        let sortNameAscending = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortNameAscending]
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var error:NSError?
        dates = appDelegate.managedObjectContext?.executeFetchRequest(fetchRequest, error: &error) as! [NSManagedObject]
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
        return dates.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("dateCell", forIndexPath: indexPath) as! UITableViewCell
    
        // Configure the cell...
        let date = dates[indexPath.row]
        cell.textLabel?.text = date.valueForKey("name") as? String
        
        return cell
    }
    
    
    // MARK: - Delegate methods
    // MARK: AddDateTableViewControllerDelegate methods
    func addDateTableViewController(viewController: AddDateTableViewController, saveDateWithName name: String) {
        
        println("saveDateWithName (delegate)")
        
        // Add student to the datasource
        let entity = NSEntityDescription.entityForName("Date", inManagedObjectContext: appDelegate.managedObjectContext!)
        let date = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: appDelegate.managedObjectContext!)
        date.setValue(name, forKey: "name")
        
        var error:NSError?
        if !(appDelegate.managedObjectContext?.save(&error) != nil){
            println("could not save \(error),  \(error?.userInfo)")
        }
        // Show the changes in the table

        
        viewController.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        tableView.reloadData()
        
    }
    
}
