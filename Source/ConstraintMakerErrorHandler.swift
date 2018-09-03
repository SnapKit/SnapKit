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

public enum ConstraintMakerError: Error {
    case invalidConstraint(file: String, line: UInt)
    case missingSuperview(file: String, line: UInt)
    case canNotConstraintToMultipleNonIdenticalAttributes(file: String, line: UInt)

    var localizedDescription: String {
        switch self {
        case let .invalidConstraint(file, line): return "Invalid constraint. (\(file), \(line))"
        case let .missingSuperview(file, line): return "Expected superview but found nil when attempting make constraint `equalToSuperview`. (\(file), \(line))"
        case let .canNotConstraintToMultipleNonIdenticalAttributes(file, line): return "Cannot constraint to multiple non identical attributes. (\(file), \(line))"
        }
    }
}

public class ConstraintMakerErrorHandler {
    private init() {}

    public static let shared = ConstraintMakerErrorHandler()

    public var errorHandler: ((Error) -> Void) = { (error: Error) in
        fatalError(error.localizedDescription)
    }
}
