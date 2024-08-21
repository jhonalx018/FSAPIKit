//
//  HTTPRequesterTest.swift
//  FSApiKitTests
//
//  Created by Jhon Gomez on 12/22/21.
//

import Foundation
import XCTest
import FSAPIKit

class HTTPRequesterTest: XCTestCase {
    
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invoc    ation of each test method in the class.
    }
    
    func testGetMethod() {
        //MOCKS
        let plainURL = "www.apple.com"
        let mockResponseURL = URL(string: plainURL)!
        
        URLProtocolMock.mockURLs = [mockResponseURL: (
            error: nil,
            data: "{\"mock\": true}".data(using: .utf8),
            response: HTTPURLResponse(url: mockResponseURL, statusCode: 200, httpVersion: "1.0", headerFields: nil)
        )]
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolMock.self]
        
        let mockSession = URLSession(configuration: sessionConfiguration)
        let httpRequester = HTTPRequest(urlSession: mockSession)
        let expectation = XCTestExpectation(description: "testing HTTPRequest with mock")
        
        httpRequester.callbackRequester(
            for: HTTPRequestModel<MockResponse>(
                url: plainURL,
                callback: { data in
                    expectation.fulfill()
                    
                    switch data {
                        case .success(let response):
                            //ASSERT
                            XCTAssertEqual(response.mock, true)
                        default:
                            XCTExpectFailure()
                    }
                }
            ), with: HTTPMethods.GET
        )
        
        // TO NO EXPECTED A FIXED TIME IF WE ARE WORKING WITH MOKCS
        wait(for: [expectation], timeout: .infinity)
    }
}

