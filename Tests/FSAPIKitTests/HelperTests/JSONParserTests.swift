//
//  JSONParserTests.swift
//  FSApiKitTests
//
//  Created by Jhon Gomez on 12/22/21.
//


import Foundation
import XCTest
import FSAPIKit

class JSONParserTest: XCTestCase {
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invoc    ation of each test method in the class.
    }
    
    func testConvertDataFromJson() {
        let dataParser = Parser()
        
        let parsed: MockResponse? = dataParser.fromJson(for: "{\"mock\": true}".data(using: .utf8)!)
        
        //ASSERT
        XCTAssertEqual(parsed?.mock, true)
    }
    
    func testConvertToJson() {
        let dataParser = Parser()
        
        let parsed: Data? = dataParser.toJson(for: MockResponse(mock: true))
        let jsonString = String(data: parsed!, encoding: .utf8)!
        
        //ASSERT
        XCTAssertEqual(true, jsonString.contains("mock"))
    }
}

