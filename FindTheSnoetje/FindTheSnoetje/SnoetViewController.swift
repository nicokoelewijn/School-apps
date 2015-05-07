//
//  SnoetViewController.swift
//  FindTheSnoetje
//
//  Created by Frederik Jacques on 05/05/15.
//  Copyright (c) 2015 devine. All rights reserved.
//

import UIKit

class SnoetViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var theView:SnoetView {
        get {
            
            return view as! SnoetView
            
        }
    }
    
    var featureContainer:UIView!
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func loadView() {
        
        view = SnoetView(frame: UIScreen.mainScreen().bounds)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        theView.detectFacesButton.addTarget(self, action: "detectSnoetjesButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    func detectSnoetjesButtonClicked( sender:UIButton ) {
    
        println("[SnoetVC] Detect button clicked")
        
        let context = CIContext(options: nil)
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: [
            CIDetectorAccuracy: CIDetectorAccuracyHigh
        ])
        let image = CIImage(image: theView.imageView.image)
        
        let features = detector.featuresInImage(image)
        let startY = theView.imageView.image!.size.height/2
        for feature in features {
        
            var featureBounds = feature.bounds
            featureBounds.origin.x      = feature.bounds.origin.x / 2
            //featureBounds.origin.y      = startY - (feature.bounds.size.height ) - (feature.bounds.origin.y)
            featureBounds.origin.y      = (feature.bounds.size.height/2) - (feature.bounds.origin.y/2) + startY
            featureBounds.size.width    = feature.bounds.size.width / 2
            featureBounds.size.height   = feature.bounds.size.height / 2
        
            var view = UIView(frame: featureBounds)
            
            view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.7)
            
            theView.imageView.addSubview(view)
            
        }
        
    
    }
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    
    
}
