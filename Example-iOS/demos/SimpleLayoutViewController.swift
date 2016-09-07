//
//  SimpleLayoutViewController.swift
//  SnapKit
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit

class SimpleLayoutViewController: UIViewController {

    var didSetupConstraints = false

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .blackColor()
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .redColor()
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellowColor()
        return view
    }()

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blueColor()
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .greenColor()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(blueView)
        view.addSubview(greenView)

        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {

        if (!didSetupConstraints) {

            blackView.snp_makeConstraints { make in
                make.center.equalTo(view)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            }

            redView.snp_makeConstraints { make in
                make.top.equalTo(blackView.snp_bottom).offset(20.0)
                make.right.equalTo(blackView.snp_left).offset(-20.0)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            }

            yellowView.snp_makeConstraints { make in
                make.top.equalTo(blackView.snp_bottom).offset(20.0)
                make.left.equalTo(blackView.snp_right).offset(20.0)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            }

            blueView.snp_makeConstraints { make in
                make.bottom.equalTo(blackView.snp_top).offset(-20.0)
                make.left.equalTo(blackView.snp_right).offset(20.0)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            }

            greenView.snp_makeConstraints { make in
                make.bottom.equalTo(blackView.snp_top).offset(-20.0)
                make.right.equalTo(blackView.snp_left).offset(-20.0)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            }

            didSetupConstraints = true
        }

        super.updateViewConstraints()
    }

}
