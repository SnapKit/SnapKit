CHANGELOG
=======

# 0.10.0 - Next Release In Development

* **BREAKING:** Using `.equalTo(<EdgeInsets>)` will no longer multiply the constants on the right/bottom edge by -1. This does not affect `.offset(<EdgeInsets>)`
* Ensure Swift 1.2 compatibility
* Added a `Snap.Config.interfaceLayoutDirection` variable for richer Leading/Trailing support.
* Fixed memory leaks that could occur on long lived views

# 0.9.x - March 2015

* Re-worked some internal API to allow for future updates
* Added `snp_prepareConstraints -> [Constraint]` which allows pre-building of constraints
* Added a fatal error to `and` when it is used after relation has been set