CHANGELOG
=======

# SnapKit 3.0

**SnapKit 3.0** is a complete re-write to take advantage of modern Swift 3.0 as well as
clean up the API. As such please use with caution and check your apps thoroughly

### Breaking

* iOS 7.0 support has been removed
* `install` and `uninstall` have been deprecated, use `activate` and `deactivate` instead
* DSL is now accessed through `.snp.*` rather than `.snp_*`. For example `view.snp.makeConstraints { }`
* Constraints are now updated through `update(offset:)`, `update(inset:)` and `update(priority:)`
* `.inset()` will no longer take `CGPoint` or `CGSize` as input
* `.offset()` will no longer take `CGPoint`, `CGSize`, `EdgeInsets` as input
* `updateConstraints` will no longer allow creating new constraints unless there are no existing constraints for the view. If it does generate new constraints it will throw a fatal error.
* `UIEdgeInsets` are now have their right and bottom value inverted for more natural results such as `make.edges.equalTo(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)).inset()`

### Enhancements

* Debugging output has been improved to show exact file/line number from which the broken constraint was created
* Exceptions thrown during constraint creation have been replaced with `fatalError` with better output
* Constraints are now installed through `NSLayoutConstraint.activate` and what view they are added to is now deferred to UIKit
* Added `var contentHugging<Axis>Priority: CGFloat` to `make`
* Added `var contentCompressionResistance<Axis>Priority: CGFloat` to `make`
* Added support for `UILayoutGuide` via `make.left.equalTo(guide.snp.top)`
* Added support for constraining edges to margins or vice versa via `make.edges.equalTo(other.snp.margins)`

# 0.22.0 - August 8 2016

* Added `layoutConstraint` getter to `Constraint` to get the underlying NSLayoutConstraints created by a constraint
* Updated support for Swift 2.3 and Xcode 8 Beta 3

# 0.21.1 - June 20 2016

* Added support for Swift 2.3

# 0.21.0 - May 11 2016

* Added `equalToSuperview()` convenience
* Enabled app extension API for tvOS and OSX

# 0.20.0 - March 25 2016

* Swift 2.2 Support
* Added a `labeled("Hello")` to constraint chain to label your constraints for debugging output.

# 0.19.1 - January 26 2016

* Rebased from 0.16.0 with only desired commits to resolve many unexpected issues

# 0.19.0 - January 21 2016

* Improved `.insets()` for `width` and `height` #183
* Added Carthage tvOS support #179
* Added Package.swift #175
* Codesign is set to Distribution on Release #181

# 0.15.0 - September 22 2015

* Fixed issues with layout guides on iOS 9
* Fixed warnings related to `guard #available` statements
* Better support for legacy platforms (iOS 7 / OS X 10.9). [Documentation Here](http://snapkit.io/legacy-platforms)

# 0.14.0 - September 12 2015

* Swift 2.0 / Xcode 7 GM

# 0.13.0 - July 30 2015

* **BREAKING:** Refactored `insets` to `inset` and it now accepts Float/Double/CGFloat/Int/UInt as well as EdgeInsets
* Size constraints to fixed constants like `make.width.equalTo(50)` now install directly on the from view rather than it’s superview
* Debugging should generate property object pointer descriptions
* Debugging now includes file/line number where the closure that created the constraint is in your code

# 0.11.0 - April 26 2015

* Removed `final` declarations as they were causing crashes in certain circumstances

# 0.10.0 - April 15 2015

* **ANNOUNCEMENT**: Snap is now SnapKit
* **BREAKING:** The constraint making chain now utilises protocols to tighten the API's to avoid user error. This may break some syntaxes.
* **BREAKING:** Semantic `and` and `with` chain variables were removed
* Added `update###` functions to `Constraint` so their constants and priorities can be updated
* Added a `SnapKit.Config.interfaceLayoutDirection` variable for richer Leading/Trailing support.
* Fixed memory leaks that could occur on long lived views
* Ensure Swift 1.2 compatibility

# 0.9.x - March 2015

* Re-worked some internal API to allow for future updates
* Added `snp_prepareConstraints -> [Constraint]` which allows pre-building of constraints
* Added a fatal error to `and` when it is used after relation has been set
