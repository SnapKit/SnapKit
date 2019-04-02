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
    
    override var description: String {
        var description = "<"
        
        description += descriptionForObject(self)
        
        if let firstItem = conditionalOptional(from: self.firstItem) {
            description += " \(descriptionForObject(firstItem))"
        }
        
        if self.firstAttribute != .notAnAttribute {
            description += ".\(descriptionForAttribute(self.firstAttribute))"
        }
        
        description += " \(descriptionForRelation(self.relation))"
        
        if let secondItem = self.secondItem {
            description += " \(descriptionForObject(secondItem))"
        }
        
        if self.secondAttribute != .notAnAttribute {
            description += ".\(descriptionForAttribute(self.secondAttribute))"
        }
        
        if self.multiplier != 1.0 {
            description += " * \(self.multiplier)"
        }
        
        if self.secondAttribute == .notAnAttribute {
            description += " \(self.constant)"
        } else {
            if self.constant > 0.0 {
                description += " + \(self.constant)"
            } else if self.constant < 0.0 {
                description += " - \(abs(self.constant))"
            }
        }
        
        if self.priority.rawValue != 1000.0 {
            description += " ^\(self.priority)"
        }
        
        description += ">"
        
        return description
    }
    
}

private func descriptionForRelation(_ relation: LayoutRelation) -> String {
    switch relation {
    case .equal:                return "=="
    case .greaterThanOrEqual:   return ">="
    case .lessThanOrEqual:      return "<="
    #if swift(>=5.0)
    @unknown default:           return "unknown"
    #endif
    }
}

private func descriptionForAttribute(_ attribute: LayoutAttribute) -> String {
    #if os(iOS) || os(tvOS)
        switch attribute {
        case .notAnAttribute:       return "notAnAttribute"
        case .top:                  return "top"
        case .left:                 return "left"
        case .bottom:               return "bottom"
        case .right:                return "right"
        case .leading:              return "leading"
        case .trailing:             return "trailing"
        case .width:                return "width"
        case .height:               return "height"
        case .centerX:              return "centerX"
        case .centerY:              return "centerY"
        case .lastBaseline:         return "lastBaseline"
        case .firstBaseline:        return "firstBaseline"
        case .topMargin:            return "topMargin"
        case .leftMargin:           return "leftMargin"
        case .bottomMargin:         return "bottomMargin"
        case .rightMargin:          return "rightMargin"
        case .leadingMargin:        return "leadingMargin"
        case .trailingMargin:       return "trailingMargin"
        case .centerXWithinMargins: return "centerXWithinMargins"
        case .centerYWithinMargins: return "centerYWithinMargins"
        #if swift(>=5.0)
        @unknown default:           return "unknown"
        #endif
    }
    #else
        switch attribute {
        case .notAnAttribute:       return "notAnAttribute"
        case .top:                  return "top"
        case .left:                 return "left"
        case .bottom:               return "bottom"
        case .right:                return "right"
        case .leading:              return "leading"
        case .trailing:             return "trailing"
        case .width:                return "width"
        case .height:               return "height"
        case .centerX:              return "centerX"
        case .centerY:              return "centerY"
        case .lastBaseline:         return "lastBaseline"
        case .firstBaseline:        return "firstBaseline"
        #if swift(>=5.0)
        @unknown default:           return "unknown"
        #endif
    }
    #endif
}

private func conditionalOptional<T>(from object: Optional<T>) -> Optional<T> {
    return object
}

private func conditionalOptional<T>(from object: T) -> Optional<T> {
    return Optional.some(object)
}

private func descriptionForObject(_ object: AnyObject) -> String {
    let pointerDescription = String(format: "%p", UInt(bitPattern: ObjectIdentifier(object)))
    var desc = ""
    
    desc += type(of: object).description()
    
    if let object = object as? ConstraintView {
        desc += ":\(object.snp.label() ?? pointerDescription)"
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
