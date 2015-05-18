//
//  TweetData.swift
//  AToThePI
//
//  Created by Nico Koelewijn on 17/05/15.
//  Copyright (c) 2015 Nico Koelewijn. All rights reserved.
//

import UIKit

class TweetData:NSObject {
    
    let tweet:String
    let username:String
    
    init( username:String, tweet:String ){
        self.username = username
        self.tweet = tweet
    }
    
    override var description:String {
        get {
            return "[TweetData] \(username) - \(tweet)"
        }
    }
}
