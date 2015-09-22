---
layout: default
id: legacy-platforms
permalink: /legacy-platforms/
---
## Legacy Platforms

If you want to use SnapKit with iOS 7.0 or OS X 10.9 you need to do a few things differently, and unfortunately manually.

#### Step 1. Integrate source code

Integrate all the `*.swift` source files in the repo into your project. We recommend using a submodule to keep the source files in sync and then dragging them into your Xcode Project.

#### Step 2. Add build setting

You must add `-DSNAPKIT_DEPLOYMENT_LEGACY` to your `OTHER_SWIFT_FLAGS` in your targets Build Settings. We require this because we couldn't find another way to allow warning free compilation on both legacy platforms that don't support frameworks and modern platforms that do.

#### Step 3. Use SnapKit

You should now be able to use `snp_makeConstraints` on any of your views. You do not need to add the `import SnapKit` statement since the source is directly integrated into your target.