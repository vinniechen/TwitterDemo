//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/7/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    
    var profileUrl: NSURL?
    var username: String?
    var name: String?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? NSString
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        if let timestampString = timestampString {
            timestamp = formatter.date(from: timestampString) as NSDate?
        }
        
        
        
        let user = dictionary["user"] as? [String : Any]
        name = user?["name"] as? [String : Any]
        username = user?["screen_name"] as? [String : Any]
        
        let profileUrlString = user?["profile_image_url_https"] as? [URL : Any]
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        print("\(username)")
        
        
    }
    
    // Returns array of home page's tweets
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        
        var tweets = [Tweet]()
        
        // iterate through dictionary
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
}
