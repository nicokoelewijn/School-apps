//
//  MainViewController.swift
//  MyLoves
//
//  Created by Nico Koelewijn on 26/02/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"

        self.createButton()
    }
    
    func createButton(){
    
        let btn = UIButton(frame: CGRectMake(0, 0, 200, 44))
        btn.setTitle("Volgend scherm", forState: UIControlState.Normal)
        btn.center = self.view.center

        btn.addTarget(self, action: "buttonTouched", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(btn)
    
    }

    func buttonTouched(){
        println("Touched")
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

