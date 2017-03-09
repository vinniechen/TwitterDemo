//
//  User.swift
//  
//
//  Created by Vinnie Chen on 3/7/17.
//
//

import UIKit

class User: NSObject {
    var name: NSString?
    var screenname: NSString?
    var profileURL: NSURL?
    var tagline: NSString?
    
    var dictionary: NSDictionary?
    
     static let userDidLogoutNotification = "UserDidLogout"
    
    // Deserialization Code from dictionary
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? NSString
        screenname = dictionary["screen_name"] as? NSString
        
        let profileURLString = dictionary["profile_image_url_https"] as? String
        if let profileURLString = profileURLString {
            profileURL = NSURL(string: profileURLString)
        }
        
        tagline = dictionary["description"] as? NSString
    }
    
    static var _currentUser: User?
    
    // getter, computer property
    class var currentUser: User? {
        // chunk of code that runs when someone tries to access property
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? NSData
                
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData as Data, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                    
                }
            }
            
            return _currentUser
        }
         // saves the user
        set(user) {
            _currentUser = user
            
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.set(nil, forKey: "currentUserData")
            }
           
            defaults.synchronize() // saves to disc when you set
        }
    }
    

}
