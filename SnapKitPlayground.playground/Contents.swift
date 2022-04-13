//: A UIKit based Playground for presenting user interface
// To use this playground, build SnapKit.framework for any simulator first.

import SnapKit
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)

        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(150)
            make.top.equalToSuperview().offset(200)
            make.size.equalTo(CGSize(width: 200, height: 20))
        }

        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
