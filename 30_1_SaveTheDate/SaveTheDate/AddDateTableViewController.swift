//
//  AddDateTableViewController.swift
//  SaveTheDate
//
//  Created by Frederik Jacques on 21/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

protocol AddDateTableViewControllerDelegate:class {
    
    func addDateTableViewController( viewController:AddDateTableViewController, saveDateWithName name:String )
    
}

class AddDateTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    var delegate:AddDateTableViewControllerDelegate?
    
    // MARK: - Initializers methods
    override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override init(style: UITableViewStyle) {
        
        super.init(style: style)
        
    }
    
    required init!(coder aDecoder: NSCoder!) {
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Add date"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveDateHandler:")
                
        tableView.registerClass(TextFieldTableViewCell.classForCoder(), forCellReuseIdentifier: "formCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    func saveDateHandler( sender:UIBarButtonItem ) {
        
        println("[AddDateVC] Save date handler")
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! TextFieldTableViewCell
        
        if let name = cell.textField?.text {
        
            if !name.isEmpty {
        
                println("[AddDateVC] The name is '\(name)'")
                self.delegate?.addDateTableViewController(self, saveDateWithName: name)
                
            }else {
                
                let alert = UIAlertController(title: "Oeps", message: "Vul een naam in", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                
                presentViewController(alert, animated: true, completion: nil)
                
            }
        
        }
        
    }
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    // MARK: - UITableViewControllerDatasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        // Return the number of sections.
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Return the number of rows in the section.
        return 1
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("formCell", forIndexPath: indexPath) as! TextFieldTableViewCell
    
        
        cell.textLabel?.text = "Naam"
    
        return cell
    }
    
    // MARK: - Delegate methods
    

}
