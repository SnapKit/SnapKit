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


public class ConstraintMakerRelatable {
    
    internal let description: ConstraintDescription
    
    internal init(_ description: ConstraintDescription) {
        self.description = description
    }
    
    internal func relatedTo(other: ConstraintRelatableTarget, relation: ConstraintRelation, file: String, line: UInt) -> ConstraintMakerEditable {
        let related: ConstraintItem
        let constant: ConstraintConstantTarget
        
        if let other = other as? ConstraintItem {
            guard other.attributes == ConstraintAttributes.None ||
                  other.attributes.layoutAttributes.count <= 1 ||
                  other.attributes.layoutAttributes == self.description.attributes.layoutAttributes else {
                fatalError("Cannot constraint to multiple non identical attributes. (\(file), \(line))");
            }
            
            related = other
            constant = 0.0
        } else if let other = other as? ConstraintView {
            related = ConstraintItem(target: other, attributes: ConstraintAttributes.None)
            constant = 0.0
        } else if let other = other as? ConstraintConstantTarget {
            related = ConstraintItem(target: nil, attributes: ConstraintAttributes.None)
            constant = other
        } else {
            fatalError("Invalid constraint. (\(file), \(line))")
        }
        
        let editable = ConstraintMakerEditable(self.description)
        editable.description.sourceLocation = (file, line)
        editable.description.relation = relation
        editable.description.related = related
        editable.description.constant = constant
        return editable
    }
    
    public func equalTo(other: ConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .Equal, file: file, line: line)
    }
    
    public func equalTo(other: ConstraintRelatableTargetShortcut, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .Equal, file: file, line: line)
    }
    
    public func lessThanOrEqualTo(other: ConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .LessThanOrEqual, file: file, line: line)
    }
    
    public func lessThanOrEqualTo(other: ConstraintRelatableTargetShortcut, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .LessThanOrEqual, file: file, line: line)
    }
    
    public func greaterThanOrEqualTo(other: ConstraintRelatableTarget, _ file: String = #file, line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .GreaterThanOrEqual, file: file, line: line)
    }
    
    public func greaterThanOrEqualTo(other: ConstraintRelatableTargetShortcut, _ file: String = #file, line: UInt = #line) -> ConstraintMakerEditable {
        return self.relatedTo(other, relation: .GreaterThanOrEqual, file: file, line: line)
    }
    
}
