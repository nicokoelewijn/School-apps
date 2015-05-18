//
//  ViewController.swift
//  core_animation
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        self.view = View(frame: UIScreen.mainScreen().bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

