//
//  MerchantServiceTest.swift
//  
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation
import XCTest
import FSAPIKit
import Combine

class MerchantServiceTest: XCTestCase {
    let merchantServiceTest = MerchantServices(
        environment: .staging
    )
    let parameters = MerchantServiceMock.parameters

    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invoc    ation of each test method in the class.
    }
    
    func testCheckMerchantGrubhubStatus() {
        let expectation = XCTestExpectation(description: "check service merchant grubhub")
        
        self.merchantServiceTest.checkServiceAvalability(for: parameters) { response in
            switch response {
                case .success(let data):
                    //ASSERT
                    XCTAssertNotNil(data.result)
                default:
                    XCTExpectFailure()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: .infinity)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testAsyncCheckMerchantGrubhubStatus() async throws {
        let response = try await self.merchantServiceTest.asyncCheckServiceAvalability(for: parameters)
        
        switch response {
            case .success(let data):
                //ASSERT
                XCTAssertNotNil(data.result)
            default:
                XCTExpectFailure()
          
        }
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testCombineCheckMerchantGrubhubStatus()  {
        let expectation = XCTestExpectation(description: "check merchant service with combine")
        var subscribe: Set<AnyCancellable> = []
        
        self.merchantServiceTest.combineCheckServiceAvalability(for: parameters)
            .sink(receiveValue: { response in
                expectation.fulfill()
                
                switch response {
                    case .success(let data):
                        //ASSERT
                        XCTAssertNotNil(data.result)
                    default:
                        XCTExpectFailure()
                }
                
            })
            .store(in: &subscribe)
        
        wait(for: [expectation], timeout: .infinity)
    }
}
