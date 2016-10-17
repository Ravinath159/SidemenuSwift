//
//  ViewController.swift
//  RkLoginDemo
//
//  Created by Admin on 09/10/16.
//  Copyright © 2016 Ravi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isValidSession() == true {
            print("I'm logged in")
            fetchDashBoard()
        }else{
            print("I'm not logged in... Please sign in")
            if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                present(loginVC, animated: true, completion: nil)
            }
        }
    }
    
    
    func fetchDashBoard(){
        getLoans()
        getMainAccount()
        
    }
    
    func getMainAccount(){
        
    }
    func getLoans(){
        
    }

    @IBAction func menuButtonAction(_ sender: AnyObject) {
        
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let containerVC = appDelegate.window!.rootViewController as! ContainerViewController
        containerVC.toggleLeftPanel()
    }
    
    func isValidSession() -> Bool{
        if UserSession.shared.accessToken != nil {
            return true
        }
        return false
    }
    
}

