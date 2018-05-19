---
layout: default
permalink: /docs/
id: docs
---
## Requirements

- iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/snapkit). (Tag 'snapkit')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/snapkit).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build SnapKit 4.0.0+.

To integrate SnapKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SnapKit', '~> 4.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SnapKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "SnapKit/SnapKit" ~> 4.0
```

Run `carthage update` to build the framework and drag the built `SnapKit.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.

---

## Usage

SnapKit is designed to be extremely easy to use. Let's say we want to layout a box that is constrained to it's superview's edges with 20pts of padding.

```swift
let box = UIView()
superview.addSubview(box)

box.snp.makeConstraints { (make) -> Void in
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

box.snp.makeConstraints { (make) -> Void in
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
make.centerX.lessThanOrEqualTo(view2.snp.left)
```

ViewAttribute              |  NSLayoutAttribute
-------------------------  |  --------------------------
view.snp.left              |  NSLayoutAttribute.left
view.snp.right             |  NSLayoutAttribute.right
view.snp.top               |  NSLayoutAttribute.top
view.snp.bottom            |  NSLayoutAttribute.bottom
view.snp.leading           |  NSLayoutAttribute.leading
view.snp.trailing          |  NSLayoutAttribute.trailing
view.snp.width             |  NSLayoutAttribute.width
view.snp.height            |  NSLayoutAttribute.height
view.snp.centerX           |  NSLayoutAttribute.centerX
view.snp.centerY           |  NSLayoutAttribute.centerY
view.snp.lastBaseline      |  NSLayoutAttribute.lastBaseline


#### 2. UIView/NSView

if you want view.left to be greater than or equal to label.left:

```swift
// these two constraints are exactly the same
make.left.greaterThanOrEqualTo(label)
make.left.greaterThanOrEqualTo(label.snp.left)
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
make.size.equalTo(CGSize(width: 50, height: 100))
make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
make.left.equalTo(view).offset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
```

### Learn to prioritize

> `.priority` allows you to specify an exact priority

Priorities can be tacked on to the end of a constraint chain like so:

```swift
make.top.equalTo(label.snp.top).priority(600)
```

You may also use priority shortcuts: `.low`, `.medium`, `.high`, `.required`.

```swift
make.top.equalTo(label.snp.top).priority(.medium)
```

### Composition, composition, composition

SnapKit also gives you a few convenience methods to create multiple constraints at the same time.

#### edges

```swift
// make top, left, bottom, right equal view2
make.edges.equalTo(view2);

// make top = superview.top + 5, left = superview.left + 10,
//      bottom = superview.bottom - 15, right = superview.right - 20
make.edges.equalTo(superview).inset(UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
```

#### size

```swift
// make width and height greater than or equal to titleLabel
make.size.greaterThanOrEqualTo(titleLabel)

// make width = superview.width + 100, height = superview.height + 100
make.size.equalTo(superview).offset(100)
```

#### center

```swift
// make centerX and centerY = button1
make.center.equalTo(button1)

// make centerX = superview.centerX + 5, centerY = superview.centerY + 5
make.center.equalTo(superview).offset(5)
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
view1.snp.makeConstraints { (make) -> Void in
  self.topConstraint = make.top.equalTo(superview).offset(padding.top).constraint
  make.left.equalTo(superview).offset(padding.left)
}

...
// then later you can call
self.topConstraint.uninstall()

// or if you want to update the constraint
self.topConstraint.updateOffset(5)
```

### 2. snp.updateConstraints

Alternative if you are only updating the **constant** value of the constraint you can use the method `snp.updateConstraints` instead of `snp.makeConstraints`

```swift
// this is Apple's recommended place for adding/updating constraints
// this method can get called multiple times in response to setNeedsUpdateConstraints
// which can be called by UIKit internally or in your code if you need to trigger an update to your constraints
override func updateConstraints() {
    self.growingButton.snp.updateConstraints { (make) -> Void in
        make.center.equalTo(self);
        make.width.equalTo(self.buttonSize.width).priority(250)
        make.height.equalTo(self.buttonSize.height).priority(250)
        make.width.lessThanOrEqualTo(self)
        make.height.lessThanOrEqualTo(self)
    }
    
   // according to Apple super should be called at end of method
	 super.updateConstraints()
}
```

### 3. snp.remakeConstraints

`snp.remakeConstraints` is similar to `snp.makeConstraints`, but will first remove all existing constraints installed by SnapKit.

```swift
func changeButtonPosition() {
  self.button.snp.remakeConstraints { (make) -> Void in 
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

### Snap view to topLayoutGuide and bottomLayoutGuide
 
 `topLayoutGuide.snp.bottom` is similar to `topLayoutGuide.bottomAnchor` and you can also use `bottomLayoutGuide.snp.top` to align view on top of UITabBar.
 
```swift
import SnapKit

class MyViewController: UIVewController {
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
           make.top.equalTo(self.topLayoutGuide.snp.bottom)
           make.left.equalTo(view)
           make.right.equalTo(view)
           make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
    }

}
```


### Snap view to safeAreaLayoutGuide

Just like `topLayoutGuide` and `bottomLayoutGuide` using iPhone X's new `safeAreaLayoutGuide` is easy:

```swift
import SnapKit

class MyViewController: UIVewController {
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
           make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }

}
```

### Debug with ease
> `.labeled` allows you to specify constraint labels for debug logs

Labels can be tacked on to the end of a constraint chain like so:

```swift
button.snp.makeConstraints { (make) -> Void in
  make.top.equalTo(otherView).labeled("buttonViewTopConstraint")
}
```

Resulting `Unable to simultaneously satisfy constraints.` logs will use constraint labels to clearly identify which constraints need attention:

```
"<SnapKit.LayoutConstraint:buttonViewTopConstraint@SignUpViewController.swift#311
UIView:0x7fd98491e4c0.leading == UIView:0x7fd983633880.leading>"
```

<br/>
<br/>
<br/>
