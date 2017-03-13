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
    var retweeted: Bool?
    var favorited: Bool?
    var id: Int?
    
    
    var user: User?
    
    
    //pt2
    
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as! String
        
        retweeted = dictionary["retweeted"] as! Bool
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        
        favorited = dictionary["favorited"] as! Bool
        favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        print("\(text)")
        
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        if let timestampString = timestampString {
            timestamp = formatter.date(from: timestampString) as NSDate?
        }
        
        let userInfo = dictionary["user"] as? NSDictionary
        name = userInfo?["name"] as! String
        username = userInfo?["screen_name"] as! String
        username = "@\(username!)"
               let profileUrlString = userInfo?["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileImageUrl = URL(string: profileUrlString)
        }
        
        didFavorite = dictionary["favorited"] as? Bool
        didRT = dictionary["retweeted"] as? Bool
        
        tweetID = dictionary["id_str"] as! String
        id = dictionary["id"] as! Int
        
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
