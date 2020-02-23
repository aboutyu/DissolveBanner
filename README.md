# THCrossDisolve
#### Super Easy Image Disolve.

# Feature
- [x] pure swift 5.0 code

# Installation

#### CocoaPods
Simply add THDissolveBanner to your `Podfile`.

```
pod 'THDissolveBanner'
```
Enter command instruction into your terminal.

```
pod install
```

# Usage

You must create UIView and it use custom class in the storyboard after install THDissolveBanner.

![](./screenshot.png)

Then you must also import THDissolveBanner and create a IBOutlet.

![](./screenshot1.png)

The following sample code for your reference.

```swift
import UIKit
import THDissolveBanner

class ViewController: UIViewController {

    @IBOutlet weak var viewDisolveImage: THDisolveBanner!
    
    let images: [String]    = ["URL", "URL", "URL", "URL"]
    let str: [String]       = ["TEXT", "TEXT", "TEXT", "TEXT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewDisolveImage.setImage(images: images, str: str)
        self.viewDisolveImage.startAnimate()  // 애니메이션 시작
        self.viewDisolveImage.stopAnimate()   // 애니메이션 종료
    }
}
```

# License

THDisolveBanner is available under the MIT license. See the LICENSE file for more info.

