# Snap

Snap is a light-weight layout framework which wraps AutoLayout with a nicer syntax. Snap has its own layout DSL which provides a chainable way of describing your NSLayoutConstraints which results in layout code that is more concise and readable. Snap supports both iOS and OS X.

> Snap uses some Swift-only features like function overloading, so it cannot be used from Objective-C. Because of this we’ve chosen to swap prefixes from Masonry’s `mas_` to `snp_` so you can use both Masonry and Snap in the same project.

## Requirements

* iOS 7.0+ / Mac OS X 10.9+ (Using Cocoapods 0.36.0.beta.1 or later – iOS 8.0+ / Mac OS X 10.9+)
* Xcode 6.1

## Installation

_Due to the current lack of [proper infrastructure](http://cocoapods.org) for Swift dependency management, using Snap in your project requires the following steps:_

1. Add Snap as a [submodule](http://git-scm.com/docs/git-submodule) by opening the Terminal, `cd`-ing into your top-level project directory, and entering the command `git submodule add https://github.com/Masonry/Snap.git`
2. Open the `Snap` folder, and drag `Snap.xcodeproj` into the file navigator of your Xcode project<sup>1</sup>.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. In the tab bar at the top of that window, open the "General" panel.
5. Click on the `+` button in the "Embedded Binaries" group of the panel and select and add `Snap.framework`.

<sup>1</sup><small>It's important you add Snap as a subproject of your Xcode Project and not of a potential Xcode Workspace containing your project</small>

## Installation (Cocoapods pre-release)

1. Add Snap as a line in your Podfile `pod 'Snap'`
2. Run `pod install`
3. Add `import Snap` to your `AppDelegate.swift`

## What's wrong with NSLayoutConstraints?

Under the hood Auto Layout is a powerful and flexible way of organising and laying out your views. However creating constraints from code is verbose and not very descriptive.
Imagine a simple example in which you want to have a view fill its superview but inset by 10 pixels on every side
```swift
let superview = self;

let view1 = UIView()
view1.setTranslatesAutoresizingMaskIntoConstraints(false)
view1.backgroundColor = UIColor.greenColor()
superview.addSubview(view1)

let padding = UIEdgeInsetsMake(10, 10, 10, 10)

superview.addConstraints([
  NSLayoutConstraint(
    item: view1,
    attribute: NSLayoutAttribute.Top,
    relatedBy: NSLayoutRelation.Equal,
    toItem: superview,
    attribute: NSLayoutAttribute.Top,
    multiplier: 1.0,
    constant: padding.top
  ),
  NSLayoutConstraint(
    item: view1,
    attribute: NSLayoutAttribute.Left,
    relatedBy: NSLayoutRelation.Equal,
    toItem: superview,
    attribute: NSLayoutAttribute.Left,
    multiplier: 1.0,
    constant: padding.left
  ),
  NSLayoutConstraint(
    item: view1,
    attribute: NSLayoutAttribute.Bottom,
    relatedBy: NSLayoutRelation.Equal,
    toItem: superview,
    attribute: NSLayoutAttribute.Bottom,
    multiplier: 1.0,
    constant: -padding.bottom
  ),
  NSLayoutConstraint(
    item: view1,
    attribute: NSLayoutAttribute.Right,
    relatedBy: NSLayoutRelation.Equal,
    toItem: superview,
    attribute: NSLayoutAttribute.Right,
    multiplier: 1.0,
    constant: -padding.right
  )
])
```
Even with such a simple example the code needed is quite verbose and quickly becomes unreadable when you have more than 2 or 3 views.
Another option is to use Visual Format Language (VFL), which is a bit less long winded.
However the ASCII type syntax has its own pitfalls and its also a bit harder to animate as `NSLayoutConstraint.constraintsWithVisualFormat` returns an array.

## Prepare to meet your Maker!

Heres the same constraints created using ConstraintMaker

```swift
let padding = UIEdgeInsetsMake(10, 10, 10, 10)

view1.snp_makeConstraints { make in
  make.top.equalTo(superview.snp_top).with.offset(padding.top) // with is an optional semantic filler
  make.left.equalTo(superview.snp_left).with.offset(padding.left)
  make.bottom.equalTo(superview.snp_bottom).with.offset(-padding.bottom)
  make.right.equalTo(superview.snp_right).with.offset(-padding.right)
}
```
Or even shorter

```swift
view1.snp_makeConstraints { make in
  make.edges.equalTo(superview).with.insets(padding)
  return // this return is a fix for implicit returns in Swift and is only required for single line constraints
}
```

Also note in the first example we had to add the constraints to the superview `superview.addConstraints`.
Snap however will automagically add constraints to the appropriate view.

Snap will also call `view1.setTranslatesAutoresizingMaskIntoConstraints(false)` for you.

## Not all things are created equal

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

if you want view.left to be greater than or equal to label.left :
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
So if you pass a primitive for these attributes Snap will turn these into constraints relative to the view&rsquo;s superview ie:
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

## Learn to prioritize

> `.prority` allows you to specify an exact priority

> `.priorityHigh` equivalent to **UILayoutPriority.DefaultHigh**

> `.priorityMedium` is half way between high and low

> `.priorityLow` equivalent to **UILayoutPriority.DefaultLow**

Priorities are can be tacked on to the end of a constraint chain like so:
```swift
make.left.greaterThanOrEqualTo(label.snp_left).with.priorityLow();

make.top.equalTo(label.snp_top).with.priority(600);
```

## Composition, composition, composition

Snap also gives you a few convenience methods which create multiple constraints at the same time.

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
make.left.right.and.bottom.equalTo(superview)
make.top.equalTo(otherView)
```

## Hold on for dear life

Sometimes you need modify existing constraints in order to animate or remove/replace constraints.
In Snap there are a few different approaches to updating constraints.

#### 1. References
You can hold on to a reference of a particular constraint by assigning the result of a constraint make expression to a local variable or a class property.
You could also reference multiple constraints by storing them away in an array.

```swift

var topConstraint: Constraint? = nil

...

// when making constraints
view1.snp_makeConstraints { make in
  self.topConstraint = make.top.equalTo(superview).with.offset(padding.top)
  make.left.equalTo(superview).with.offset(padding.left)
}

...
// then later you can call
self.topConstraint.uninstall()
```

### 2. snp_remakeConstraints

`snp_remakeConstraints` is similar to `snp_makeConstraints`, but will first remove all existing constraints installed by Snap.

```swift
func changeButtonPosition() {
  self.button.snp_remakeConstraints { make in 
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

## Code Snippets

Copy the included code snippets to ``~/Library/Developer/Xcode/UserData/CodeSnippets`` to write your snap closures at lightning speed!

`snp_make` -> `<view>.snp_makeConstraints { make in <code> }`
    
`snp_remake` -> `<view>.snp_remakeConstraints { make in <code> }`

## TODO

* Eye candy
* Example projects
* Tests
