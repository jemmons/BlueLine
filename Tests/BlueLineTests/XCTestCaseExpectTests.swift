import Foundation
import XCTest
import BlueLine



class XCTestCaseExpectTests: XCTestCase {
  func testExpect() {
    let calledFourTimes = expectation(description: "waiting to be called four times")
    calledFourTimes.expectedFulfillmentCount = 4
    
    expected("thing should happen") { should in
      should.fulfill()
      calledFourTimes.fulfill()
    }
    
    expected("thing should happen but won't") { should in
      should.isInverted.toggle()
      calledFourTimes.fulfill()
    }
    
    unexpected("thing shouldn't happen") { shouldnt in
      calledFourTimes.fulfill()
    }

    unexpected("thing shouldn't happen but will") { shouldnt in
      shouldnt.isInverted.toggle()
      shouldnt.fulfill()
      calledFourTimes.fulfill()
    }
    
    wait(for: [calledFourTimes], timeout: 0)
  }
  
  
  func testExpectedCount() {
    expected("This to happen three times", count: 3) { should in
      should.fulfill()
      should.fulfill()
      should.fulfill()
    }
  }
  
  
  func testExpectedTimeouts() {
    expected("should not time out", timeout: 2) { should in
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        should.fulfill()
      }
    }
    
    unexpected("should not time out", timeout: 2) { shouldnt in
      shouldnt.isInverted.toggle()
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        shouldnt.fulfill()
      }
    }
  }
}
