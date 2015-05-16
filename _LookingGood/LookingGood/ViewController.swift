//
//  ViewController.swift
//  LookingGood
//
//  Created by Nico Koelewijn on 06/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentImage:Int{
        didSet {
            if( currentImage < 1){
                currentImage = 6;
            }
            if(currentImage > 6){
                currentImage = 0;
            }
            let image = UIImage(named: String(currentImage))
            self.myView.imageView.image = image
        }

    }
    
    var myView:MyView! {
        get {
            return self.view as! MyView
        }
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
    
        self.currentImage = 1;
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        println("[ViewController] loading custom view")
        var bounds = UIScreen.mainScreen().bounds
        self.view = MyView(frame: bounds)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("[ViewController] View did load")
        
        self.myView.btnRight.addTarget(self, action: "rightClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.myView.btnLeft.addTarget(self, action: "leftClicked", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    func rightClicked(){
        println("[VC] right clicked")
        self.currentImage++;
    }
    
    func leftClicked(){
        println("[VC] left clicked")
        self.currentImage--;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

