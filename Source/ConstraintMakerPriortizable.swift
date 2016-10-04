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


public class ConstraintMakerPriortizable: ConstraintMakerFinalizable {
    
    public enum Priority: Strideable, RawRepresentable, Equatable {
        case low
        case medium
        case high
        case required
        case custom(value: Float)
        
        public init?(rawValue: Float) {
            // TODO:
            // constrain to 0<= x <= 1000 else throw an error
            self = .custom(value: rawValue)
        }
        
        public var rawValue: Float {
            switch self {
            case .low:
                return 250.0
            case .medium:
                return 500.0
            case .high:
                return 750.0
            case .required:
                return 1000.0
            case let .custom(value):
                return value
            }
        }
        
        public func advanced(by n: Float) -> Priority {
            return .custom(value: self.rawValue + n)
        }
        
        public func distance(to other: Priority) -> Float {
            return other.rawValue - self.rawValue
        }
        
        public static func ==(lhs: Priority, rhs: Priority) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
    }
    
    @discardableResult
    public func priority(level: Priority) -> ConstraintMakerFinalizable {
        return self.priority(level: ConstraintMakerPriortizable.Priority(rawValue: level.rawValue)!)
    }
    
//    @discardableResult
//    func priority(_ amount: ConstraintPriorityTarget) -> ConstraintMakerFinalizable {
//        self.description.priority = amount
//        return self
//    }
//    
//    @discardableResult
//    public func priorityRequired() -> ConstraintMakerFinalizable {
//        return self.priority(Priority.required as! ConstraintPriorityTarget)
//    }
//    
//    @discardableResult
//    public func priorityHigh() -> ConstraintMakerFinalizable {
//        return self.priority(Priority.high as! ConstraintPriorityTarget)
//    }
//    
//    @discardableResult
//    public func priorityMedium() -> ConstraintMakerFinalizable {
//        return self.priority(Priority.medium as! ConstraintPriorityTarget)
//    }
//    
//    @discardableResult
//    public func priorityLow() -> ConstraintMakerFinalizable {
//        return self.priority(Priority.low as! ConstraintPriorityTarget)
//    }
    
}
