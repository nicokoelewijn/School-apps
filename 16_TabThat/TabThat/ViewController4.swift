//
//  ViewController4.swift
//  TabThat
//
//  Created by Nico Koelewijn on 05/03/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override init(nibName nibNameOrNill: String?, bundle nibBundleOrNill: NSBundle?){
        super.init(nibName: nibNameOrNill, bundle: nibBundleOrNill)
        self.title = "4"
        self.tabBarItem.badgeValue = "Ja"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
