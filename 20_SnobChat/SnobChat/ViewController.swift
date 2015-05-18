//
//  ViewController.swift
//  SnobChat
//
//  Created by Nico Koelewijn on 17/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SnobChat"
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "cameraButtonTouched")
    }
    
    func cameraButtonTouched(){
        println("Camera button touched")
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            println("camer beschikbaar")
            
            var mediatypes = UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera)
            println(mediatypes)
            
            let imagepicker = UIImagePickerController()
            imagepicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagepicker.mediaTypes = mediatypes!
            imagepicker.delegate = self
            
            self.presentViewController(imagepicker, animated: true, completion: nil)

        } else {
            println("camera niet beschikbaar")
            
        }
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {

        let image = info[UIImagePickerControllerOriginalImage] as! UIImage

        self.imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "tickHandler", userInfo: nil, repeats: false)
    }
    
    func tickHandler(){
        self.imageView.image = nil;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

