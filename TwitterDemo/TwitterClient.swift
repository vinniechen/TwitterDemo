//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/7/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "Kja2VYnElH2p807Owr2qxFnop", consumerSecret: "4QGF0kKiBMAFV448cM4YRlmIxFLKAv0zEl2X0PDk6L2F9hSWJH" )
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    
    // login
    func login( success: @escaping () -> (), failure: @escaping (Error) -> () ) {
        loginSuccess = success
        loginFailure = failure
        
        TwitterClient.sharedInstance?.deauthorize()
        TwitterClient.sharedInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterdemo://oauth")!, scope: nil, success: {
            (requestToken: BDBOAuth1Credential?) -> Void in
            print("I got a token!")
            
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken!.token!)")!
            UIApplication.shared.openURL(url)
            
            
        }, failure: {(error: Error?) -> Void in
            self.loginFailure?(error!)
            print("Error: \(error!.localizedDescription)")
        })
    }
    
    // logout
    func logout() {
        User.currentUser = nil
        deauthorize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userDidLogoutNotification), object: nil)
    }

    // handles open url
    func handleOpenUrl(url: URL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        TwitterClient.sharedInstance?.fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: {
            (requestToken: BDBOAuth1Credential?) -> Void in
            print("I got the request token!")
            
            self.currentAccount(success: { (user: User) in
                User.currentUser = user // triggers call to setter and save user
                
                // logged in at this point
                self.loginSuccess?()
            }, failure: { (error: Error) in
                self.loginFailure!(error)
            })
            
            
            
            
        }, failure: {(error: Error?) -> Void in
            self.loginFailure!(error!)
            print("Error: \(error!.localizedDescription)")
        })
    }
    
    // fetches home timeline
    func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as? [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries: dictionaries!)
            
            success(tweets)
        }, failure: { (task: URLSessionDataTask?, error: Error) -> Void in
            failure(error)
        })
    }
    
    // fetches current account
    func currentAccount(success: @escaping (User) -> (), failure: (Error) -> ()) {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let userDictionary = response as? NSDictionary
            let user = User(dictionary: userDictionary!)
            print(user)
            
            success(user)
            
        }, failure: { (task: URLSessionDataTask?, response: Any?) -> Void in
            
        })
    }
   /*
    // fetches selected user
    func getUser(user_id: Int) {
        
        get("1.1/users/show.json", parameters: user_id, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let userDictionary = response as? NSDictionary
            let user = UserProfile(dictionary: userDictionary!)
            print(user)
            
            
            
        }, failure: { (task: URLSessionDataTask?, response: Any?) -> Void in
            
        })
        
    } */
    
    
}
