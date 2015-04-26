CHANGELOG
=======

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