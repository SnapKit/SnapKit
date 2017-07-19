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
    typealias NSLayoutRelationGeneric = NSLayoutRelation
    typealias NSLayoutAttributeGeneric = NSLayoutAttribute
    typealias UILayoutPriorityGeneric = UILayoutPriority
#else
    import AppKit
    typealias NSLayoutRelationGeneric = NSLayoutConstraint.Relation
    typealias NSLayoutAttributeGeneric = NSLayoutConstraint.Attribute
    typealias UILayoutPriorityGeneric = NSLayoutConstraint.Priority
#endif

