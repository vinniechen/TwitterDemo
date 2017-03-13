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
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            self.tableView.reloadData()
            
        }, failure: { (error: Error) in
            print("\(error.localizedDescription)")
        })
    }
        
    
    
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
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
        if segue.identifier == "detailsSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let tweet = tweets?[(indexPath?.row)!]
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.tweet = tweet
        }
        
        if segue.identifier == "composeSegue" {
            if let navController = segue.destination as? UINavigationController {
                let topViewController = navController.topViewController as! ComposeViewController
               
            }
        }
        
        if segue.identifier == "profileSegue" {
            
            let button = sender as! UIButton
            let view = button.superview!
            let cell = view.superview as! UITableViewCell
            
            
            let indexPath = tableView.indexPath(for: cell)
            let tweet = tweets?[(indexPath?.row)!]
           // print("tweet \(tweet)")
            let user = tweet?.user
           // print("BEFORE SEGUE: \(user!)")
            
           
            if let profileController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                profileController.user = user //set the profile user before your push
                //self.navigationController?.pushViewController(profileController, animated: true)
            }

        }
        
        
       /*
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies?[(indexPath?.row)!]
        
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.movie = movie
 */
        
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
