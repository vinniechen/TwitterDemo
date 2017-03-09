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
   
        TwitterClient.sharedInstance?.login(success: {
            print("I've logged in")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }) { (error: Error) in
            print("Error: \(error.localizedDescription)")
        }
    
    
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
