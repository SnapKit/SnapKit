//
//  ViewController.swift
//  Snappy
//
//  Created by Jonas Budelmann on 25/07/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview: UIView = self.view
        
        let view1 = UIView(frame: CGRectZero)
        view1.backgroundColor = UIColor.greenColor()
        view1.layer.borderColor = UIColor.blackColor().CGColor
        view1.layer.borderWidth = 2
        superview.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.redColor()
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 2
        superview.addSubview(view2)
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.blueColor()
        view3.layer.borderColor = UIColor.blackColor().CGColor
        view3.layer.borderWidth = 2
        superview.addSubview(view3)
        
        let padding = EdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        
        
        view1.snp_makeConstraints { make in
            make.top.and.left.equalTo(superview).insets(padding)
            make.size.equalTo(CGSizeMake(100, 50))
        }
        
        view2.snp_makeConstraints { make in
            make.centerX.equalTo(view1.snp_centerX).offset(CGPointMake(50, 0))
            make.top.equalTo(view1.snp_bottom).offset(50)
            make.width.equalTo(view1.snp_height)
            make.height.equalTo(view1.snp_width)
        }
        
        view3.snp_makeConstraints { make in
            make.width.height.greaterThanOrEqualTo(view1)
            make.width.height.greaterThanOrEqualTo(view2)
            make.center.equalTo(superview)
        }
        
    }

}

