<img src="http://snapkit.io/images/banner.png" alt="" />

SnapKit is a DSL to make Auto Layout easy on both iOS and OS X.

[![Build Status](https://travis-ci.org/SnapKit/SnapKit.svg)](https://travis-ci.org/SnapKit/SnapKit)

> SnapKit does build just fine, Travis.ci doesn't support Swift 1.2 yet so this will show as failing until it is supported.

```swift
import SnapKit

class MyViewController: UIViewController {

    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(box)
        box.snp_makeConstraints { (make) -> Void in
           make.width.height.equalTo(50)
           make.center.equalTo(self.view)
        }
    }

}
```

## Resources

* [Documentation](http://snapkit.io/docs/)
* [F.A.Q.](http://snapkit.io/faq/)

## License

MIT license. See the `LICENSE` file for details.
