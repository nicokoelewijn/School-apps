//
//  ViewController.swift
//  UnderMySkin
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Under My Skin"
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-title"))
        self.view.backgroundColor = UIColor.whiteColor()

        //navigationController?.navigationBar.barTintColor = UIColor.yellowColor()
        
        let bgImage = UIImage(named: "nav-background")
        navigationController?.navigationBar.setBackgroundImage(bgImage, forBarMetrics: UIBarMetrics.Default)
        createButton()
    }

    func createButton(){
    
        let btn = UIButton(frame: CGRectMake(0, 0, 200, 44))
        btn.setTitle("Volgend Scherm", forState: .Normal)
        btn.backgroundColor = UIColor.blackColor()
        btn.center = self.view.center
        btn.addTarget(self, action: "buttonTouched", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func buttonTouched(){
        println("touched")
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

