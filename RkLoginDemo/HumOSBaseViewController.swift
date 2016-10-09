//
//  HumOSBaseViewController.swift
//  HumOS
//
//  Created by Nandu Ahmed on 9/14/16.
//  Copyright © 2016 Sikka Software. All rights reserved.
//

import UIKit

class HumOSBaseViewController: UIViewController , ContainerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let containerVC = appDelegate.window!.rootViewController as! ContainerViewController
        containerVC.delegate = self
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavBar()

        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let containerVC = appDelegate.window!.rootViewController as! ContainerViewController
        containerVC.delegate = self
    }

    func hideNavBar() {
        navigationController!.navigationBar.barTintColor = UIColor(red:0.14, green:0.74, blue:1.00, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func showNavBar() {
        
    }

}
