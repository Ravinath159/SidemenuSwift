//
//  SignUpViewController.swift
//  RkLoginDemo
//
//  Created by kvanamac3 on 10/10/16.
//  Copyright © 2016 Ravi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func signUpAction(_ sender: AnyObject) {

        navigationController?.popToRootViewController(animated: true)

    }
}
