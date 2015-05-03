---
layout: default
id: faq
permalink: /faq/
---
## FAQ

#### CocoaPods won't let me install SnapKit into my iOS 7.0 project?

SnapKit doesn't use any iOS 8.0 specific APIs, but since Xcode does not support integrating Swift code without dynamic frameworks it cannot be integrated via a framework for iOS 7.0 deployments. You should instead embed the source code directly into your application.

#### Do you have any examples?

We're working on getting some great examples! Stay tuned.

#### What about Swift's operator overloading?

SnapKit's intention is to be simple and understandable to ensure new users and old alike can easily dive in and get going. While operator overloading may make the code a bit more concise it greatly reduces the readability.

#### Why not just use Interface Builder?

SnapKit is about building code based views and layouts. Interface Builder is fiddly and limiting when it comes to building constraints and is a nightmare for your source control change logs.

#### Who's behind all this?

* [Robert Payne](https://github.com/robertjpayne)
* [Jonas Budelmann](https://github.com/cloudkite)
* [Countless others](https://github.com/SnapKit/SnapKit/graphs/contributors)
