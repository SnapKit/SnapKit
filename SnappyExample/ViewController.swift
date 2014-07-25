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
        
        let view1 = UIView()
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
        
        let padding = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        
        view1.mas_makeConstraints({ make in
            make.top.and.left.greaterThanOrEqualTo(superview).insets(padding);
            
            make.bottom.equalTo(view3.mas_top).insets(padding);
            make.right.equalTo(view2.mas_left).insets(padding);
            make.width.equalTo(view2.mas_width);
            
            make.height.equalTo([view2, view3]);
        });
        
        view2.mas_makeConstraints({ make in
            // chain attributes
            make.top.and.right.equalTo(superview).insets(padding);
            
            make.left.equalTo(view1.mas_right).insets(padding);
            make.bottom.equalTo(view3.mas_top).insets(padding);
            make.width.equalTo(view1.mas_width);
            
            make.height.equalTo([view1, view3]);
        });
        
        view3.mas_makeConstraints({ make in
            make.top.equalTo(view1.mas_bottom).insets(padding);
            
            // chain attributes
            make.left.right.and.bottom.equalTo(superview).insets(padding);
            
            make.height.equalTo([view1, view2]);
        });
        
    }

}

