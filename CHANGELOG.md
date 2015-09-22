CHANGELOG
=======

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