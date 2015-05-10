//
//  SharingViewController.swift
//  SharingIsCaring
//
//  Created by Frederik Jacques on 06/05/15.
//  Copyright (c) 2015 devine. All rights reserved.
//

import UIKit
import Social

class SharingViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var theView:SharingView {
        
        get {
            
            return view as! SharingView
            
        }
        
    }
    
    // MARK: - Initializers methods
    
    
    // MARK: - Lifecycle methods
    override func loadView() {
        
        view = SharingView(frame: UIScreen.mainScreen().bounds)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if(SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)){
            println("Facebook beschikbaar")
            
        } else {
            
            println("FB niet beschikbaar")
        }
        
        title = "Sharing is caring"
        
        
        let facebook = UIBarButtonItem(title: "Facebook", style: UIBarButtonItemStyle.Plain, target: self, action: "facebookClicked:")
        
        let twitter = UIBarButtonItem(title: "Twitter", style: UIBarButtonItemStyle.Plain, target: self, action: "twitterClicked:")
        
        let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        presentViewController(facebookVC, animated: true, completion: { ()
            -> Void in
        })

        facebookVC.setInitialText("Test")
        facebookVC.addImage(theView.imageView.image)
        facebookVC.addURL(NSURL(string: "http://www.google.nl"))
        
        navigationItem.rightBarButtonItems = [facebook, twitter]
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    func facebookClicked( sender:UIBarButtonItem ){
        
           }
    
    func twitterClicked( sender:UIBarButtonItem ){
        
       
        
    }
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
    
    
}
