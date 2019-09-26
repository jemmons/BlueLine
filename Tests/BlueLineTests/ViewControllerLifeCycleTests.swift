#if canImport(UIKit)
import UIKit
import XCTest
import BlueLine


fileprivate class ControllerWithLifecycle: UIViewController {
  var loadTriggered = false
  var viewDidLoadTriggered = false
  var viewWillAppearTriggered = false
  var viewDidAppearTriggered = false
  var viewWillDisappearTriggered = false
  var viewDidDisappearTriggered = false
  
  
  override func loadView() {
    view = UIView(frame: .zero)
    loadTriggered = true
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    precondition(!viewDidLoadTriggered)
    viewDidLoadTriggered = true
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    precondition(!viewWillAppearTriggered)
    viewWillAppearTriggered = true
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    precondition(!viewDidAppearTriggered)
    viewDidAppearTriggered = true
  }
  
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    precondition(!viewWillDisappearTriggered)
    viewWillDisappearTriggered = true
  }
  
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    precondition(!viewDidDisappearTriggered)
    viewDidDisappearTriggered = true
  }
}



class ViewControllerLifeCycleTests: XCTestCase {
  func testLifecycle() {
    let controller = ControllerWithLifecycle()
    
    F(controller.loadTriggered)
    F(controller.viewDidLoadTriggered)
    F(controller.viewWillAppearTriggered)
    F(controller.viewDidAppearTriggered)
    F(controller.isViewLoaded)
    F(controller.viewWillDisappearTriggered)
    F(controller.viewDidDisappearTriggered)

    controller.inViewLifecycle {
      T(controller.loadTriggered)
      T(controller.viewDidLoadTriggered)
      T(controller.viewWillAppearTriggered)
      T(controller.viewDidAppearTriggered)
      T(controller.isViewLoaded)
      NOTNIL(controller.view)
      F(controller.viewWillDisappearTriggered)
      F(controller.viewDidDisappearTriggered)
    }
    
    T(controller.loadTriggered)
    T(controller.viewDidLoadTriggered)
    T(controller.viewWillAppearTriggered)
    T(controller.viewDidAppearTriggered)
    T(controller.isViewLoaded)
    T(controller.viewWillDisappearTriggered)
    T(controller.viewDidDisappearTriggered)
  }
  
}
#endif
