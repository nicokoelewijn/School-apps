//
//  TextFieldTableViewCell.swift
//  SaveTheDate
//
//  Created by Frederik Jacques on 21/04/15.
//  Copyright (c) 2015 Devine. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    var textField:UITextField?
    
    // MARK: - Initializers methods
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        
        textField = UITextField(frame: CGRectMake(self.bounds.size.width - 220, 0, 200, self.bounds.size.height))
        textField?.textAlignment = NSTextAlignment.Right
        contentView.addSubview(textField!)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    
    // MARK: - Delegate methods
}
