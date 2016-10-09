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


    @IBAction func menuButtonAction(_ sender: AnyObject) {
        
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let containerVC = appDelegate.window!.rootViewController as! ContainerViewController
        containerVC.toggleLeftPanel()
    }
}

