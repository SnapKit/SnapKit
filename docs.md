---
layout: default
permalink: /docs/
id: docs
---
## Requirements

* iOS 7.0+ / OS X 10.9+
* Xcode 6.3+

> While SnapKit supports iOS 7.0, frameworks are not supported for iOS 7.0 so you must manually embed the framework for non app store apps or integrate the source files directly.

## Installing

The first thing you’ll need to do with SnapKit is get it installed into your project. We support three different integrations:

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SnapKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SnapKit', '~> 0.12.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

Carthage is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SnapKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "SnapKit/SnapKit" >= 0.12.0
```

### Embedded Framework

- Add SnapKit as a [submodule](http://git-scm.com/docs/git-submodule) by opening the Terminal, `cd`-ing into your top-level project directory, and entering the following command:

```bash
$ git submodule add https://github.com/SnapKit/SnapKit.git
```

- Open the `SnapKit` folder, and drag `SnapKit.xcodeproj` into the file navigator of your app project.
- In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
- Ensure that the deployment target of `SnapKit.framework` matches that of the application target.
- In the tab bar at the top of that window, open the "Build Phases" panel.
- Expand the "Target Dependencies" group, and add `SnapKit.framework`.
- Click on the `+` button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add `SnapKit.framework`.

## Usage

SnapKit is designed to be extremely easy to use. Let's say we want to layout a box that is constrained to it's superview's edges with 20pts of padding.

```swift
let box = UIView()
superview.addSubview(box)

box.snp_makeConstraints { (make) -> Void in
    make.top.equalTo(superview).offset(20)
    make.left.equalTo(superview).offset(20)
    make.bottom.equalTo(superview).offset(-20)
    make.right.equalTo(superview).offset(-20)
}
```

Or even shorter:

```swift
let box = UIView()
superview.addSubview(box)

box.snp_makeConstraints { (make) -> Void in
    make.edges.equalTo(superview).inset(UIEdgeInsetsMake(20, 20, 20, 20))
}
```

Not only does this greatly shorten and increase the readability of constraints SnapKit is also taking care of a few crucial steps in the process:

- Determining the best common superview to install the constraints on.
- Keeping track of the constrainted installed so they can easily be removed later.
- Ensuring `setTranslatesAutoresizingMaskIntoConstraints(false)` is called on all appropriate views.

### Not all things are created equal

> `.equalTo` equivalent to **NSLayoutRelation.Equal**

> `.lessThanOrEqualTo` equivalent to **NSLayoutRelation.LessThanOrEqual**

> `.greaterThanOrEqualTo` equivalent to **NSLayoutRelation.GreaterThanOrEqual**

These three equality constraints accept one argument which can be any of the following:

#### 1. ViewAttribute

```swift
make.centerX.lessThanOrEqualTo(view2.snp_left)
```

ViewAttribute              |  NSLayoutAttribute
-------------------------  |  --------------------------
view.snp_left              |  NSLayoutAttribute.Left
view.snp_right             |  NSLayoutAttribute.Right
view.snp_top               |  NSLayoutAttribute.Top
view.snp_bottom            |  NSLayoutAttribute.Bottom
view.snp_leading           |  NSLayoutAttribute.Leading
view.snp_trailing          |  NSLayoutAttribute.Trailing
view.snp_width             |  NSLayoutAttribute.Width
view.snp_height            |  NSLayoutAttribute.Height
view.snp_centerX           |  NSLayoutAttribute.CenterX
view.snp_centerY           |  NSLayoutAttribute.CenterY
view.snp_baseline          |  NSLayoutAttribute.Baseline


#### 2. UIView/NSView

if you want view.left to be greater than or equal to label.left:

```swift
// these two constraints are exactly the same
make.left.greaterThanOrEqualTo(label)
make.left.greaterThanOrEqualTo(label.snp_left)
```

#### 3. Strict Checks

Auto Layout allows width and height to be set to constant values.
if you want to set view to have a minimum and maximum width you could pass a primitive to the equality blocks:

```swift
// width >= 200 && width <= 400
make.width.greaterThanOrEqualTo(200)
make.width.lessThanOrEqualTo(400)
```

However Auto Layout does not allow alignment attributes such as left, right, centerY etc to be set to constant values.
So if you pass a primitive for these attributes SnapKit will turn these into constraints relative to the view's superview ie:

```swift
// creates view.left <= view.superview.left + 10
make.left.lessThanOrEqualTo(10)
```

You can also use other primitives and structs to build your constraints, like so:

```swift
make.top.equalTo(42)
make.height.equalTo(20)
make.size.equalTo(CGSizeMake(50, 100))
make.edges.equalTo(UIEdgeInsetsMake(10, 0, 10, 0))
make.left.equalTo(view).offset(UIEdgeInsetsMake(10, 0, 10, 0))
```

### Learn to prioritize

> `.prority` allows you to specify an exact priority

> `.priorityHigh` equivalent to **UILayoutPriority.DefaultHigh**

> `.priorityMedium` is half way between high and low

> `.priorityLow` equivalent to **UILayoutPriority.DefaultLow**

Priorities are can be tacked on to the end of a constraint chain like so:

```swift
make.left.greaterThanOrEqualTo(label.snp_left).priorityLow()
make.top.equalTo(label.snp_top).priority(600)
```

### Composition, composition, composition

SnapKit also gives you a few convenience methods to create multiple constraints at the same time.

#### edges

```swift
// make top, left, bottom, right equal view2
make.edges.equalTo(view2);

// make top = superview.top + 5, left = superview.left + 10,
//      bottom = superview.bottom - 15, right = superview.right - 20
make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20))
```

#### size

```swift
// make width and height greater than or equal to titleLabel
make.size.greaterThanOrEqualTo(titleLabel)

// make width = superview.width + 100, height = superview.height - 50
make.size.equalTo(superview).offset(CGSizeMake(100, -50))
```

#### center

```swift
// make centerX and centerY = button1
make.center.equalTo(button1)

// make centerX = superview.centerX - 5, centerY = superview.centerY + 10
make.center.equalTo(superview).offset(CGPointMake(-5, 10))
```

You can chain view attributes for increased readability:

```swift
// All edges but the top should equal those of the superview
make.left.right.bottom.equalTo(superview)
make.top.equalTo(otherView)
```

### Hold on for dear life

Sometimes you need modify existing constraints in order to animate or remove/replace constraints.
In SnapKit there are a few different approaches to updating constraints.

#### 1. References
You can hold on to a reference of a particular constraint by assigning the result of a constraint make expression to a local variable or a class property.
You could also reference multiple constraints by storing them away in an array.

```swift
var topConstraint: Constraint? = nil

...

// when making constraints
view1.snp_makeConstraints { (make) -> Void in
  self.topConstraint = make.top.equalTo(superview).offset(padding.top).constraint
  make.left.equalTo(superview).offset(padding.left)
}

...
// then later you can call
self.topConstraint.uninstall()

// or if you want to update the constraint
self.topConstraint.updateOffset(5)
```

### 2. snp_updateConstraints

Alternative if you are only updating the **constant** value of the constraint you can use the method `snp_updateConstraints` instead of `snp_makeConstraints`

```swift
// this is Apple's recommended place for adding/updating constraints
// this method can get called multiple times in response to setNeedsUpdateConstraints
// which can be called by UIKit internally or in your code if you need to trigger an update to your constraints
override func updateConstraints() {
    self.growingButton.snp_updateConstraints { (make) -> Void in
        make.center.equalTo(self);
        make.width.equalTo(self.buttonSize.width).priorityLow()
        make.height.equalTo(self.buttonSize.height).priorityLow()
        make.width.lessThanOrEqualTo(self)
        make.height.lessThanOrEqualTo(self)
    }
    
    // according to apple super should be called at end of method
	 super.updateConstraints()
}
```

### 3. snp_remakeConstraints

`snp_remakeConstraints` is similar to `snp_makeConstraints`, but will first remove all existing constraints installed by SnapKit.

```swift
func changeButtonPosition() {
  self.button.snp_remakeConstraints { (make) -> Void in 
    make.size.equalTo(self.buttonSize)

    if topLeft {
      make.top.left.equalTo(10)
    } else {
      make.bottom.equalTo(self.view).offset(-10)
      make.right.equalTo(self.view).offset(-10)
    }
  }
}
```

## Features

* Not limited to a subset of Auto Layout. Anything NSLayoutConstraint can do SnapKit can also do.
* Better debugging support to help find breaking constraints.
* No crazy operator overloads.
* Not string or dictionary based and you get the strictest compile time checks possible.

## TODO

* Example Projects
* Better Debugging Support
