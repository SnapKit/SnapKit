## SnapKit 3.0 Migration Guide

SnapKit 3.0 has many breaking changes from earlier versions. You can read the [notes on releases](https://github.com/SnapKit/SnapKit/releases) for more details.

1. Upgrade SnapKit installation
2. Find all `snp_` and replace with `snp.`
3. Find all `equalTo(UIEdgeInsets)` and ensure any right or bottom inset values are no longer inverted
4. Build and fix deprecated APIs
5. Test every screen of UI to ensure visual compatibility

If you find any issues with migration please open an issue.

### Known Quirks

1. `make.center.equalTo(0)` now positions a view at 0,0 in it's superview rather than the center, use `make.center.equalToSuperview` instead.
2. `updateConstraints` will throw a fatal error if it generates a *new* constraint that did not exist before. Instead use `makeConstraints` to add additional constraints.