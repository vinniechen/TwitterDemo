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
            
        }
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
