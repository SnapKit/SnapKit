//
//  SnapKit
//
//  Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public extension LayoutConstraint {
    
    override public var description: String {
        var description = "<"
        
        description += descriptionForObject(self)
        
        description += " \(descriptionForObject(self.firstItem))"
        if self.firstAttribute != .NotAnAttribute {
            description += ".\(descriptionForAttribute(self.firstAttribute))"
        }
        
        description += " \(descriptionForRelation(self.relation))"
        
        if let secondItem: AnyObject = self.secondItem {
            description += " \(descriptionForObject(secondItem))"
        }
        
        if self.secondAttribute != .NotAnAttribute {
            description += ".\(descriptionForAttribute(self.secondAttribute))"
        }
        
        if self.multiplier != 1.0 {
            description += " * \(self.multiplier)"
        }
        
        if self.secondAttribute == .NotAnAttribute {
            description += " \(self.constant)"
        } else {
            if self.constant > 0.0 {
                description += " + \(self.constant)"
            } else if self.constant < 0.0 {
                description += " - \(CGFloat.abs(self.constant))"
            }
        }
        
        if self.priority != 1000.0 {
            description += " ^\(self.priority)"
        }
        
        description += ">"
        
        return description
    }
    
}

private func descriptionForRelation(relation: NSLayoutRelation) -> String {
    switch relation {
    case .Equal:                return "=="
    case .GreaterThanOrEqual:   return ">="
    case .LessThanOrEqual:      return "<="
    }
}

private func descriptionForAttribute(attribute: NSLayoutAttribute) -> String {
    #if os(iOS) || os(tvOS)
        switch attribute {
        case .NotAnAttribute:       return "notAnAttribute"
        case .Top:                  return "top"
        case .Left:                 return "left"
        case .Bottom:               return "bottom"
        case .Right:                return "right"
        case .Leading:              return "leading"
        case .Trailing:             return "trailing"
        case .Width:                return "width"
        case .Height:               return "height"
        case .CenterX:              return "centerX"
        case .CenterY:              return "centerY"
        case .LastBaseline:         return "lastBaseline"
        case .FirstBaseline:        return "firstBaseline"
        case .TopMargin:            return "topMargin"
        case .LeftMargin:           return "leftMargin"
        case .BottomMargin:         return "bottomMargin"
        case .RightMargin:          return "rightMargin"
        case .LeadingMargin:        return "leadingMargin"
        case .TrailingMargin:       return "trailingMargin"
        case .CenterXWithinMargins: return "centerXWithinMargins"
        case .CenterYWithinMargins: return "centerYWithinMargins"
        }
    #else
        switch attribute {
        case .NotAnAttribute:       return "notAnAttribute"
        case .Top:                  return "top"
        case .Left:                 return "left"
        case .Bottom:               return "bottom"
        case .Right:                return "right"
        case .Leading:              return "leading"
        case .Trailing:             return "trailing"
        case .Width:                return "width"
        case .Height:               return "height"
        case .CenterX:              return "centerX"
        case .CenterY:              return "centerY"
        case .LastBaseline:         return "lastBaseline"
        default:                    return "default"
        }
    #endif
}

private func descriptionForObject(object: AnyObject) -> String {
    let pointerDescription = NSString(format: "%p", ObjectIdentifier(object).uintValue)
    var desc = ""
    
    desc += object.dynamicType.description()
    
    if let object = object as? ConstraintView {
        desc += ":\(object.snp.label ?? pointerDescription)"
    } else if let object = object as? LayoutConstraint {
        desc += ":\(object.label ?? pointerDescription)"
    } else {
        desc += ":\(pointerDescription)"
    }
    
    if let object = object as? LayoutConstraint, let file = object.constraint?.sourceLocation.0, let line = object.constraint?.sourceLocation.1 {
        desc += "@\((file as NSString).lastPathComponent)#\(line)"
    }
    
    desc += ""
    return desc
}
