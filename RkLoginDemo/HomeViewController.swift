//
//  HomeViewController.swift
//  RkLoginDemo
//
//  Created by Admin on 09/10/16.
//  Copyright © 2016 Ravi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var arrayOfNames:[String] = []
    @IBOutlet weak var cellLBL: UILabel!
    @IBOutlet weak var cellImg: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        arrayOfNames=["saideep","sandeep","ravi","ramu"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
       // cell.textLabel?.text = self.items[indexPath.row]
        
//        return cell        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        cell.layoutMargins = UIEdgeInsets.zero
//        cell.preservesSuperviewLayoutMargins = false
//        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = arrayOfNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    

}
