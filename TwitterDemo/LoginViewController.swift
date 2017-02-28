//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Vinnie Chen on 2/28/17.
//  Copyright © 2017 Vinnie Chen. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")! as URL!, consumerKey: "Kja2VYnElH2p807Owr2qxFnop", consumerSecret: "4QGF0kKiBMAFV448cM4YRlmIxFLKAv0zEl2X0PDk6L2F9hSWJH")
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: { (requestToken: (BDBOAuth1Credential!) -> Void
            
            )}, failure: <#T##((Error?) -> Void)!##((Error?) -> Void)!##(Error?) -> Void#>)
        
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
