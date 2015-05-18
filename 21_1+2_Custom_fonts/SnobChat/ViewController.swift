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
    var customFontLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longText = "Maecenas sed diam eget risus varius blandit sit amet non magna. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor." as NSString
        
        let font = UIFont(name: "Fox&Cat", size: 20)
        let boundingBox = longText.boundingRectWithSize(CGSizeMake(250, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font!], context: nil)
        
        self.title = "SnobChat"
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.customFontLabel = UILabel(frame: CGRectMake(50, 150, boundingBox.size.width, boundingBox.size.height))
        self.customFontLabel.text = longText as String
        self.customFontLabel.font = UIFont(name: "Fox&Cat", size: 14)
        self.customFontLabel.numberOfLines = 0
        self.customFontLabel.sizeToFit()

        self.view.addSubview(self.customFontLabel)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "cameraButtonTouched")
        
        enumerateFonts()
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

