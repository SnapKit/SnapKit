//
//  Constraint.swift
//  ExpressiveLayout
//
//  Created by Jonas Budelmann on 5/06/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

import Foundation

protocol Constraint {
    func add(other: Any) -> Constraint
    func equalTo(other: Any) -> Constraint
}