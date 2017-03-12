//
//  DetailViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/9/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
   
    var tweet: Tweet!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var textButton: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    
    var tweetID: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
       tweetID =  tweet.tweetID
        nameLabel.text = tweet.name
        textButton.text = tweet.text
        usernameLabel.text = tweet.username as String?
      
        retweetLabel.text = "\(tweet.retweetCount)"
        favoriteLabel.text = "\(tweet.favoriteCount)"
    
        profileImage.setImageWith(tweet.profileImageUrl!)
        
        favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        if tweet.didFavorite == true {
            favoriteButton.tintColor = UIColor.red
        } else {
            favoriteButton.tintColor = UIColor.gray
            
        }
        retweetButton.setImage(UIImage(named: "black_retweet"), for: .normal)
        if tweet.didRT == true {
            retweetButton.tintColor = UIColor.blue
        } else {
            retweetButton.tintColor = UIColor.gray
        }
    }
    
    var favoriteString: String!
    var retweetString: String!
    
    
    @IBAction func retweetPress(_ sender: Any) {
            self.retweetString = "1.1/statuses/retweet/\(tweetID).json" 
        TwitterClient.sharedInstance?.post(retweetString, parameters: nil, progress: nil, success: { (task: URLSessionDataTask, Any) in
                self.retweetButton.tintColor = UIColor.blue
                self.dismiss(animated: true, completion: nil)
            
        }, failure: { (task: URLSessionDataTask?, error: Error) in
                print("Error: \(error.localizedDescription)")
        })
        
    } 
    
    @IBAction func favoritePress(_ sender: Any) {
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
