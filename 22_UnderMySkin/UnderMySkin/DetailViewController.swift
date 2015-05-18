//
//  DetailViewController.swift
//  UnderMySkin
//
//  Created by Nico Koelewijn on 18/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        self.view.backgroundColor = UIColor.redColor()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-arrow")
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back-arrow")
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
