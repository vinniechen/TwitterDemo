//
//  TweetCell.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/8/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var retweetImage: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            //nameLabel.text = tweet.
            nameLabel.text = tweet.name
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.username as String?
            dateTimeLabel.text = "\(tweet.timestamp!)"
            retweetCountLabel.text = "\(tweet.retweetCount)"
            likeCountLabel.text = "\(tweet.favoriteCount)"
            pictureImage.setImageWith(tweet.profileImageUrl!)
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
    }
    
    @IBAction func retweetPress(_ sender: Any) {
        retweetButton.tintColor = UIColor.blue
        retweetCountLabel.text = "\(tweet.retweetCount+1)"
    }
    
    @IBAction func favoritePress(_ sender: Any) {
        favoriteButton.tintColor = UIColor.red
        likeCountLabel.text = "\(tweet.favoriteCount+1)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
