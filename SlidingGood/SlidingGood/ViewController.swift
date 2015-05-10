//
//  ViewController.swift
//  SlidingGood
//
//  Created by Nico Koelewijn on 25/02/15.
//  Copyright (c) 2015 Donut Enterprise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        println("[ViewController] Loading custom view")
        var bounds = UIScreen.mainScreen().bounds
        
        self.view = SliderView(frame: bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let subview = UIView(frame: CGRectMake(30, 100, 200, 150))
//        subview.backgroundColor = UIColor.yellowColor()
//        self.view.addSubview(subview)
        // Do any additional setup after loading the view, typically from a nib.
        println("[ViewController] view did load")
        self.view.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

