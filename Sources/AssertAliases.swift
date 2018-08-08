import Foundation
import XCTest



public func T(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
  XCTAssert(expression, message, file: file, line: line)
}


public func F(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
  XCTAssertFalse(expression, message, file: file, line: line)
}


public func NIL(_ expression: @autoclosure () throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
  XCTAssertNil(expression, message, file: file, line: line)
}


public func NOTNIL(_ expression: @autoclosure () throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
  XCTAssertNotNil(expression, message, file: file, line: line)
}


public func EQ<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T: Equatable {
  XCTAssertEqual(expression1, expression2, message, file: file, line: line)
}


public func EQ<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint {
  XCTAssertEqual(expression1, expression2, accuracy: accuracy, message, file: file, line: line)
}


public func NOTEQ<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T: Equatable {
  XCTAssertNotEqual(expression1, expression2, message, file: file, line: line)
}


public func NOTEQ<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint {
  XCTAssertNotEqual(expression1, expression2, accuracy: accuracy, message, file: file, line: line)
}
