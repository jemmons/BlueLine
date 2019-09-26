import Foundation
import XCTest



public extension XCTestCase {
  func expected(_ description: String, count: Int = 1, timeout: TimeInterval = 0, ƒ: (XCTestExpectation)->Void) {
    let expectation = XCTestExpectation(description: description)
    expectation.expectedFulfillmentCount = count
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
