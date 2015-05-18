//
//  ViewController.swift
//  SnobChat
//
//  Created by Frederik Jacques on 10/03/15.
//  Copyright (c) 2015 Frederik Jacques. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView:UIImageView!
    var customFontLabel:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let theString = "Devine rocks" as NSString
        let theRange = theString.rangeOfString("rocks")
        let attString = NSMutableAttributedString(string: theString as String)
        
        attString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, theString.length))
        attString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.redColor(), range: theRange)
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellowColor(), range: theRange)

        /* // whole text styled
        let attString = NSAttributedString(string: "Devine rocks", attributes: [
            NSBackgroundColorAttributeName: UIColor.redColor(),
            NSForegroundColorAttributeName: UIColor.yellowColor()
        ])
        */
        
        self.title = "Snobchat"
    
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        
        self.customFontLabel = UILabel(frame: CGRectMake(50, 150, 200, 44))
        self.customFontLabel.text = "Devine rocks"
        self.customFontLabel.attributedText = attString
        self.customFontLabel.font = UIFont(name: "Nilland-Black", size: 20)
        self.view.addSubview(self.customFontLabel)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "cameraButtonTouched");
        
        self.enumerateFonts()
    }
    
    func enumerateFonts(){

        for fontFamily in UIFont.familyNames() {
            
            println("Font family name = \(fontFamily as! String)");
            
            for fontName in UIFont.fontNamesForFamilyName(fontFamily as! String) {
                
                println("- Font name = \(fontName)");
                
            }
            
            println("\n");
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cameraButtonTouched(){
    
        println("Camera button touched");
    
        if ( UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) ){
            
            println("Camera beschikbaar");
            var mediatypes = UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera)
            println(mediatypes) // public.image, public.movie
            
            let imagepicker = UIImagePickerController()
            imagepicker.delegate = self;
            imagepicker.mediaTypes = mediatypes!
            imagepicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.presentViewController(imagepicker, animated: true, completion: nil)
            
        }else{
            
            println("Camera niet beschikbaar");
            
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {

        let image = info[UIImagePickerControllerOriginalImage] as! UIImage

        self.imageView.image = image;
     
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "tickHandler", userInfo: nil, repeats: false)
    }
    
    func tickHandler(){
        
        self.imageView.image = nil;
        
    }


}

