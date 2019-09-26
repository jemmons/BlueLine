import Foundation
import XCTest
import BlueLine



class UserDefaultsPersistentDomainTests: XCTestCase {
  override func setUp() {
    UserDefaults.standard.set("bar", forKey: "foo")
  }

  
  override func tearDown() {
    UserDefaults.standard.removeObject(forKey: "foo")
    UserDefaults.standard.removeObject(forKey: "baz")
  }

  
  func testSwapPersistentDomain() {
    let defs = UserDefaults.standard
    EQ(defs.string(forKey: "foo"), "bar")
    UserDefaults.fake {
      NIL(defs.string(forKey: "foo"))
      defs.set("thud", forKey: "baz")
      EQ(defs.string(forKey: "baz"), "thud")
    }

    NIL(defs.string(forKey: "baz"))
    EQ(defs.string(forKey: "foo"), "bar")
  }
}
