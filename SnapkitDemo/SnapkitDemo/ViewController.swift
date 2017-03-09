//
//  ViewController.swift
//  SnapkitDemo
//
//  Created by Neelam Sharma on 1/5/16.
//  Copyright © 2016 Neelam Sharma. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var fillStarImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var checkHereLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyConstFillStarImageView()
        applyConstArrowImageView()
        applyConstCheckHereLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func applyConstFillStarImageView() {
        fillStarImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(80)
            make.left.equalTo(self.view).offset(70)
            make.bottom.equalTo(self.arrowImageView).offset(40)
            make.right.equalTo(self.view).offset(37)
            make.height.equalTo(self.view).offset(205)
        }
    }

    func applyConstArrowImageView() {
        arrowImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.fillStarImageView).offset(40)
            make.left.equalTo(self.view).offset(128)
            make.bottom.equalTo(self.checkHereLabel).offset(23)
            make.height.equalTo(self.view).offset(52)
        }
    }

    func applyConstCheckHereLabel() {
        checkHereLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.arrowImageView).offset(23)
            make.left.equalTo(self.view).offset(34)
            make.right.equalTo(self.view).offset(425)
            make.bottom.equalTo(self.view).offset(130)
            make.width.equalTo(self.view).offset(107)
            make.height.equalTo(self.view).offset(18)
        }
    }

}

