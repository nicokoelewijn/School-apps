//
//  ViewController.swift
//  alert_controller
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model:DaModel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        model = DaModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "naamInModelChangedHandler:", name: "NAAM_CHANGED", object: model)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        model.naam = "Nico"

    }
    
    func naamInModelChangedHandler(notification:NSNotification){
        println("naam veranderd naar \(model.naam)")
        let alert = UIAlertController(title: "Ola", message: "De naam is geweizigd", preferredStyle: UIAlertControllerStyle.ActionSheet)

        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            println("Ok geklikt")
        }

        let destroyAction = UIAlertAction(title: "Destroy", style: UIAlertActionStyle.Destructive) { action -> Void in
            println("Destroy geklikt")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            println("Cancel geklikt")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destroyAction)

        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "NAAM_CHANGED", object: model)
    }
    
    
}
