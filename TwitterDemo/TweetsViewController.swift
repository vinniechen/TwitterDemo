//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/7/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    var tweets: [Tweet]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            
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
        if let movies = movies {
            return movies.count
        }
        else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        let tweet = tweets[indexPath.row]
        let 
        
       /* let movie = movies![indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        let baseURL = "https://image.tmdb.org/t/p/w500"
        if let posterURL = movie["poster_path"] as? String { // nil check
            let imageURL = NSURL(string: baseURL + posterURL)
            cell.posterView.setImageWith(imageURL! as URL)
        }
        
        cell.TitleLabel.text = title
        cell.OverviewLabel.text = overview
        
        //cell.textLabel!.text = title as! String
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
