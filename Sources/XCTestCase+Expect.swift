import Foundation
import XCTest



public extension XCTestCase {
  func expected(_ description: String, timeout: TimeInterval = 0, ƒ: (XCTestExpectation)->Void) {
    let expectation = XCTestExpectation(description: description)
    ƒ(expectation)
    wait(for: [expectation], timeout: timeout)
  }
  
  
  func unexpected(_ description: String, timeout: TimeInterval = 0, ƒ: (XCTestExpectation)->Void) {
    let expectation = XCTestExpectation(description: description)
    expectation.isInverted = true
    ƒ(expectation)
    wait(for: [expectation], timeout: timeout)
  }
}
