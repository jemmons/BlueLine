import XCTest
import BlueLine

class BlueLineTests: XCTestCase {
  func testTrue() {
    T(true)
    T(1 == 1)
    T(1 == 1, "message")
  }
  
  
  func testFalse() {
    F(false)
    F(1 == 3)
    F(1 == 3, "message")
  }
  
 
  func testEqual() {
    EQ(1, 1)
    EQ("hello", "hello")
    EQ(1, 1, "message")
  }
  
  
  func testNil() {
    NIL(nil)
    NIL(nil, "message")
  }
  
  
  func testNotNil() {
    NOTNIL(1)
    let optional: String? = "not nil"
    NOTNIL(optional)
    NOTNIL("foo", "message")
  }
}
