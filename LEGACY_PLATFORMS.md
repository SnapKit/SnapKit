SnapKit supports legacy platforms but only through manual integration of the code:

Legacy Platforms are:

* iOS 7.0
* OS X 10.9

You must integrate SnapKit manually by dragging the source code into your project and in your project you must add `-DSNAPKIT_DEPLOYMENT_LEGACY` to `OTHER_SWIFT_FLAGS` in your target's build settings.

Unfortunately there is no other way to ensure that iOS 8.0/9.0 targets have no warnings and iOS 7.0 still works.