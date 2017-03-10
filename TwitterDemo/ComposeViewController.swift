//
//  ComposeViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 3/9/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
   
    @IBOutlet weak var tweetText: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    
    let postString = "1.1/statuses/update.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.setImageWith((User._currentUser?.profileURL)! as URL)
        tweetText.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPost(_ sender: Any) {
        var params = [String: AnyObject]()
            params["status"] = tweetText.text as AnyObject?
            params["in_reply_to_status_id"] = "" as AnyObject?
        
        TwitterClient.sharedInstance?.post(postString, parameters: params, progress: nil, success: { (task: URLSessionDataTask, Any) in
            self.dismiss(animated: true, completion: nil)
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            print("Error: \(error.localizedDescription)")
        })
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
