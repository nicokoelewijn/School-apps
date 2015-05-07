//
//  FilterViewController.swift
//  ImageFilters
//
//  Created by Frederik Jacques on 27/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    // MARK: - IBOutlets
    var theView:FilterView {
        
        get {
            return view as! FilterView
        }
        
    }
    // MARK: - Properties
    
    // MARK: - Initializers methods
    
    // MARK: - Lifecycle methods
    override func loadView() {
        
        let bounds = UIScreen.mainScreen().bounds
        
        self.view = FilterView(frame: bounds)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        theView.btnSepia.addTarget(self, action: "sepiaButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        theView.btnTwirl.addTarget(self, action: "twirlButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    func sepiaButtonClicked( sender:UIButton ){
        
        println("[FilterVC] Sepia button clicked");
        
        let context = CIContext(options: nil)
        let image = CIImage(image: theView.imageView.image)
        
        let filter = CIFilter(name: "CISepiaTone", withInputParameters: [
            kCIInputImageKey: image,
            kCIInputIntensityKey: NSNumber(double: 1)
        ])
        
        let result = filter.outputImage
        
        theView.imageView.image = UIImage(CIImage: result)
        
    }
    
    func twirlButtonClicked( sender:UIButton){
    
        println("[FilterVC twirl button clicked]")
        let context = CIContext(options: nil)
        let image = CIImage(image: theView.imageView.image)
        let filter = CIFilter(name: "CITwirlDistortion", withInputParameters: [
            kCIInputImageKey: image,
            kCIInputCenterKey: CIVector(x: theView.imageView.frame.width, y: theView.imageView.frame.height),
            kCIInputRadiusKey: NSNumber(double: 100.00),
            kCIInputAngleKey: NSNumber(double: 3.14)
        ])
        
        let result = filter.outputImage
        
        theView.imageView.image = UIImage(CIImage: result)
    
    }
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
    


}
