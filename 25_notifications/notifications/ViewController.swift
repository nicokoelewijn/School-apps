//
//  ViewController.swift
//  notifications
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
        
        model.naam = "Nico"
    }

    func naamInModelChangedHandler(notification:NSNotification){
        println("naam veranderd naar \(model.naam)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "NAAM_CHANGED", object: model)
    }


}

