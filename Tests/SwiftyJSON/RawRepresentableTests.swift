//  RawRepresentableTests.swift
//
//  Copyright (c) 2014 Pinglin Tang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import XCTest
import SwiftyJSON
import Foundation

class RawRepresentableTests: XCTestCase {

    func testNumber() {
        var json:JSON = JSON(rawValue: 948394394.347384 as NSNumber)!
        XCTAssertEqual(json.int!, 948394394)
        XCTAssertEqual(json.intValue, 948394394)
        XCTAssertEqual(json.double!, 948394394.347384)
        XCTAssertEqual(json.doubleValue, 948394394.347384)
        XCTAssertTrue(json.float! == 948394394.347384)
        XCTAssertTrue(json.floatValue == 948394394.347384)

#if os(Linux)
        let object: Any = json.rawValue
#else
        let object: AnyObject = json.rawValue
#endif
        // XCTAssertEqual(object as? Int, 948394394)
        // XCTAssertEqual(object as? Double, 948394394.347384)
        // XCTAssertTrue(object as! Float == 948394394.347384)
        XCTAssertEqual(object as? NSNumber, 948394394.347384)
    }
    
    func testBool() {
        var jsonTrue:JSON = JSON(rawValue: true as NSNumber)!
        print(jsonTrue.type, jsonTrue, jsonTrue.bool)
        XCTAssertEqual(jsonTrue.bool!, true)
        XCTAssertEqual(jsonTrue.boolValue, true)
        
        var jsonFalse:JSON = JSON(rawValue: false)!
        XCTAssertEqual(jsonFalse.bool!, false)
        XCTAssertEqual(jsonFalse.boolValue, false)

#if os(Linux)
        let objectTrue: Any = jsonTrue.rawValue
#else
        let objectTrue: AnyObject = jsonTrue.rawValue
#endif
        // XCTAssertEqual(objectTrue as? Int, 1)
        // XCTAssertEqual(objectTrue as? Double, 1.0)
        // XCTAssertEqual(objectTrue as? Bool, true)
        XCTAssertEqual(objectTrue as? NSNumber, NSNumber(value: true))

#if os(Linux)
        let objectFalse: Any = jsonFalse.rawValue
#else
        let objectFalse: AnyObject = jsonFalse.rawValue
#endif
        // XCTAssertEqual(objectFalse as? Int, 0)
        // XCTAssertEqual(objectFalse as? Double, 0.0)
        // XCTAssertEqual(objectFalse as? Bool, false)
        XCTAssertEqual(objectFalse as? NSNumber, NSNumber(value: false))
    }
    
    func testString() {
        let string = "The better way to deal with JSON data in Swift."
        if let json:JSON = JSON(rawValue: string) {
            XCTAssertEqual(json.string!, string)
            XCTAssertEqual(json.stringValue, string)
            XCTAssertTrue(json.array == nil)
            XCTAssertTrue(json.dictionary == nil)
            XCTAssertTrue(json.null == nil)
            XCTAssertTrue(json.error == nil)
            XCTAssertTrue(json.type == .String)
            XCTAssertEqual(json.object as? String, string)
        } else {
            XCTFail("Should not run into here")
        }
#if os(Linux)
        let object: Any = JSON(rawValue: string)!.rawValue
#else
        let object: AnyObject = JSON(rawValue: string)!.rawValue
#endif
        XCTAssertEqual(object as? String, string)
    }
    
    func testNil() {
        if let _ = JSON(rawValue: NSObject()) {
            XCTFail("Should not run into here")
        }
    }
    
    func testArray() {
#if os(Linux)
        let array: [Any]
#else
        let array: [AnyObject]
#endif
        array = [1, 2, "3", 4102, "5632", "abocde", "!@# $%^&*()"]
        if let json:JSON = JSON(rawValue: array) {
            XCTAssertEqual(json, JSON(array))
        }
#if os(Linux)
        let object: Any = JSON(rawValue: array)!.rawValue
        XCTAssertTrue(array.bridge() == object as! NSArray)
#else
        let object: AnyObject = JSON(rawValue: array)!.rawValue
        XCTAssertTrue(array == object as! NSArray)
#endif
    }
    
    func testDictionary() {
#if os(Linux)
        let dictionary: [String: Any]
#else
        let dictionary: [String: AnyObject]
#endif
        dictionary = ["1":2,"2":2,"three":3,"list":["aa","bb","dd"]]
        if let json:JSON = JSON(rawValue: dictionary) {
            XCTAssertEqual(json, JSON(dictionary))
        }

#if os(Linux)
        let object: Any = JSON(rawValue: dictionary)!.rawValue
        XCTAssertTrue(dictionary.bridge() == object as! NSDictionary)
#else
        let object: AnyObject = JSON(rawValue: dictionary)!.rawValue
        XCTAssertTrue(dictionary == object as! NSDictionary)
#endif
    }
}

extension RawRepresentableTests {

    static var allTests: [(String, (RawRepresentableTests) -> () throws -> Void)] {
        return [("testNumber", testNumber),
                ("testBool", testBool),
                ("testString", testString),
                ("testNil", testNil),
                ("testArray", testArray),
                ("testDictionary", testDictionary)]
    }
}