//
//  LoginViewController.swift
//  RkLoginDemo
//
//  Created by Admin on 09/10/16.
//  Copyright © 2016 Ravi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func forgotAction(_ sender: AnyObject) {
    }
    @IBAction func loginAction(_ sender: AnyObject) {
        
        let x = "XYZ"
        UserSession.shared.accessToken = x
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func signUpActon(_ sender: AnyObject) {
        
        let signUpVc = storyboard?.instantiateViewController(withIdentifier: "signUp") as! SignUpViewController
        self.present(signUpVc, animated:true, completion:nil)
    }
    @IBAction func forgot_Action(_ sender: AnyObject) {
    }
}
