//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/7/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    
    var profileImageUrl: URL?
    var username: String?
    var name: String?
    var didFavorite: Bool!
    var didRT: Bool!
    var tweetID: String?
    
    //pt2
    
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as! String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        print("\(text)")
        
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        if let timestampString = timestampString {
            timestamp = formatter.date(from: timestampString) as NSDate?
        }
        
        let user = dictionary["user"] as? NSDictionary
        name = user?["name"] as! String
        username = user?["screen_name"] as! String
        username = "@\(username)"
        
        let profileUrlString = user?["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileImageUrl = URL(string: profileUrlString)
        }
        
        didFavorite = dictionary["favorited"] as? Bool
        didRT = dictionary["retweeted"] as? Bool
        
        tweetID = dictionary["id_str"] as! String
        
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
