//
//  LayoutGuide+SnapKit.swift
//  SnapKit
//
//  Created by Schumacher Peter on 29/08/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit

/**
 Used to expose public API on UILayoutGuide
 */
@available(iOS 9.0, *)
public extension UILayoutGuide {
    /// left edge
    public var snp_left: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }
    
    /// top edge
    public var snp_top: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Top) }
    
    /// right edge
    public var snp_right: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Right) }
    
    /// bottom edge
    public var snp_bottom: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Bottom) }
    
    /// leading edge
    public var snp_leading: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Leading) }
    
    /// trailing edge
    public var snp_trailing: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Trailing) }
    
    /// width dimension
    public var snp_width: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Width) }
    
    /// height dimension
    public var snp_height: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Height) }
    
    /// centerX position
    public var snp_centerX: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterX) }
    
    /// centerY position
    public var snp_centerY: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterY) }
    
    /// baseline position
    public var snp_baseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Baseline) }
    
    /// first baseline position
    public var snp_firstBaseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.FirstBaseline) }
    
    /// left margin
    public var snp_leftMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeftMargin) }
    
    /// right margin
    public var snp_rightMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.RightMargin) }
    
    /// top margin
    public var snp_topMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TopMargin) }
    
    /// bottom margin
    public var snp_bottomMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.BottomMargin) }
    
    /// leading margin
    public var snp_leadingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeadingMargin) }
    
    /// trailing margin
    public var snp_trailingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TrailingMargin) }
    
    /// centerX within margins
    public var snp_centerXWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterXWithinMargins) }
    
    /// centerY within margins
    public var snp_centerYWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterYWithinMargins) }
    
    // top + left + bottom + right edges
    public var snp_edges: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Edges) }
    
    // width + height dimensions
    public var snp_size: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Size) }
    
    // centerX + centerY positions
    public var snp_center: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Center) }
    
    // top + left + bottom + right margins
    public var snp_margins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Margins) }
    
    // centerX + centerY within margins
    public var snp_centerWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterWithinMargins) }
    
}
