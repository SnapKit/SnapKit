//
//  ViewController.swift
//  Example-iOS
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UITableViewController {

    let kCellIdentifier = "CellIdentifier"
    let demos = ["Simple Layout", "Basic UIScrollView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SnapKit iOS Demos"
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = demos[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let viewController = SimpleLayoutViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.row == 1 {
            let viewController = BasicUIScrollViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

