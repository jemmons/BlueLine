import UIKit



public extension UIViewController {
  func inViewLifecycle(_ ƒ: ()->Void) {
    let _ = view //Loads view. Also triggers `viewDidLoad`
    viewWillAppear(false)
    viewDidAppear(false)
    ƒ()
    viewWillDisappear(false)
    viewDidDisappear(false)
  }
}

