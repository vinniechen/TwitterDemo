//
//  ProfileViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/9/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var numTweetsLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(user)
        nameLabel.text = user.name as String?
        usernameLabel.text = user.screenname as String?
        followersLabel.text = "\(user.followers!) followers"
        followingLabel.text = "\(user.following!) following"
        numTweetsLabel.text = "\(user.numTweets!) tweets"
        profileImage.setImageWith(user.profileURL as! URL)
        descriptionLabel.text = user.tagline as String?
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
