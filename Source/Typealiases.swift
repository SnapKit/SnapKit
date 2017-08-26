//
//  Typealiases.swift
//  SnapKit
//
//  Created by Raimon Lapuente on 19/07/2017.
//  Copyright © 2017 SnapKit Team. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    typealias LayoutRelation = NSLayoutRelation
    typealias LayoutAttribute = NSLayoutAttribute
    typealias LayoutPriority = UILayoutPriority
#else
    import AppKit
    typealias LayoutRelation = NSLayoutConstraint.Relation
    typealias LayoutAttribute = NSLayoutConstraint.Attribute
    typealias LayoutPriority = NSLayoutConstraint.Priority
#endif

