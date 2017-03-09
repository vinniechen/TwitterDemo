//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/7/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            self.tableView.reloadData()
            
            // use information from home timeline to reload data
        }, failure: { (error: Error) in
            print("\(error.localizedDescription)")
        })
    }
    
    @IBAction func logout(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            
            return tweets.count
        }
        else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets![indexPath.row]
        
       /* cell.tweetTextLabel.text = tweets[indexPath.row].text as! String
        cell.nameLabel.text = tweets[indexPath.row].name! as String
        cell.dateTimeLabel.text = "\(tweets[indexPath.row].timestamp)"
        cell.likeCountLabel.text =  */
        
        /*
        cell.tweetLabel.text = tweets?[indexPath.row].text as? String
        cell.nameLabel.text = tweets?[indexPath.row].username as? String
        cell.tweetID = tweets?[indexPath.row].tweetID as? String
        
        let retweets = tweets?[indexPath.row].retweetCount
        if retweets == nil {
            cell.retweetCount.text =  ""
        } else {
            cell.retweetCount.text =  "\(retweets!)"
            let retweetOffImg = UIImage(named: "retweet") as UIImage?
            cell.retweetButton.setImage(retweetOffImg, forState: .Normal)
            
            let replyImg = UIImage(named: "reply") as UIImage?
            
            cell.replyButton.setImage(replyImg, forState: .Normal)
        }
        
        let favorites = tweets?[indexPath.row].favoritesCount
        if favorites == nil {
            cell.favoriteCount.text = ""
        } else {
            cell.favoriteCount.text =  "\(favorites!)"
            let likeOffImg = UIImage(named: "like") as UIImage?
            cell.favoriteButton.setImage(likeOffImg, forState: .Normal)
            
        }
        
        let didRetweet = tweets?[indexPath.row].retweeted
        if didRetweet == true {
            cell.retweetButton.setImage(self.retweetOnImg, forState: .Normal)
        }
        
        let didFavorite = tweets?[indexPath.row].favorited
        if didFavorite == true {
            cell.favoriteButton.setImage(self.likeOnImg, forState: .Normal)
        }
        
        let screen_name = tweets?[indexPath.row].screenname as? String
        if screen_name == nil {
            cell.screennameLabel.text = ""
        } else {
            cell.screennameLabel.text = "@\(screen_name!)"
        }
        
        let timestamp = tweets?[indexPath.row].timestamp
        if timestamp == nil {
            cell.timestampLabel.text =  ""
        } else {
            cell.timestampLabel.text =  "\(timestamp!)"
        }
        
        let imageUrl = tweets?[indexPath.row].profileUrl
        if imageUrl == nil {
            cell.profileImg.image = nil
        } else {
            cell.profileImg.setImageWithURL(imageUrl!)
        }
      */
        return cell
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
