//
//  MembershipServiceTest.swift
//  FSApiKitTests
//
//  Created by Jhon Gomez on 12/22/21.
//

import Foundation
import XCTest
import FSAPIKit
import Combine

class MembershipServiceTest: XCTestCase {
    var memberShip: MembershipService = MembershipService()
    let membershipV2 = MembershipsV2()
    let membershipV3 = MembershipsV3()
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invoc    ation of each test method in the class.
    }
    
    // WORKS ONLY THROUGH FIVESTARS VPN
    func testGetMembership() {
        let expectation = XCTestExpectation(description: "getting memberships")

        self.memberShip.getMemberships(for: MembershipServiceDataMock.getMermbershipParams) { data in
            expectation.fulfill()

            switch data {
                case .success(let memberships):
                    //ASSERT
                    XCTAssertEqual(1, memberships.items.count)
                    XCTAssertEqual(30, memberships.meta.limit)
                default:
                    XCTExpectFailure()
            }
        }

        wait(for: [expectation], timeout: 4.5)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testAsyncGetMembership() async throws {
        let response = try await self.memberShip.asyncGetMemberships(for: MembershipServiceDataMock.getMermbershipParams)
        
        switch response {
            case .success(let memberships):
                //ASSERT
                XCTAssertEqual(1, memberships.items.count)
                XCTAssertEqual(30, memberships.meta.limit)
            default:
                XCTExpectFailure()
          
        }
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testCombineGetMembership()  {
        let expectation = XCTestExpectation(description: "getting memberships using combine")
        var subscribe: Set<AnyCancellable> = []
        
        self.memberShip.combineGetMemberships(for: MembershipServiceDataMock.getMermbershipParams)
            .sink(receiveValue: { response in
                expectation.fulfill()
                
                switch response {
                    case .success(let memberships):
                        //ASSERT
                        XCTAssertEqual(1, memberships.items.count)
                        XCTAssertEqual(30, memberships.meta.limit)
                    default:
                        XCTExpectFailure()
                }
                
            })
            .store(in: &subscribe)
        
        wait(for: [expectation], timeout: 4.5)
    }
    
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testCombineGetMembershipCancellPreviousRequest()  {
        let expectation = XCTestExpectation(description: "getting memberships using combine")
        var subscribe: Set<AnyCancellable> = []
        
        for _ in 0...4 {
            // Remove previous subscriptions
            subscribe.removeAll()
            
            self.memberShip.combineGetMemberships(for: MembershipServiceDataMock.getMermbershipParams)
                .sink(receiveValue: { response in
                    expectation.fulfill()
                    
                    switch response {
                        case .success(let memberships):
                            //ASSERT
                            XCTAssertEqual(1, memberships.items.count)
                            XCTAssertEqual(30, memberships.meta.limit)
                        default:
                            XCTExpectFailure()
                    }
                    
                })
                .store(in: &subscribe)
        }
        
        // ASSERT number of subscriptions
        XCTAssertEqual(subscribe.count, 1)
        
        wait(for: [expectation], timeout: .infinity)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testCombineGetRewardsV3()  {
        let expectation = XCTestExpectation(description: "getting rewards using combine v3")
        var subscribe: Set<AnyCancellable> = []
        
        self.membershipV3.combineGetRewards(for: MembershipServiceDataMock.getMermbershipParamsV3)
            .sink(receiveValue: { response in
                expectation.fulfill()
                
                switch response {
                    case .success(let rewards):
                        //ASSERT
                        print(rewards)
                    default:
                        XCTExpectFailure()
                }
            })
            .store(in: &subscribe)
        
        wait(for: [expectation], timeout: .infinity)
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    func testCombineGetRewards()  {
        let expectation = XCTestExpectation(description: "getting rewards using combine")
        var subscribe: Set<AnyCancellable> = []
        
        self.membershipV2.combineGetRewards(for: MembershipServiceDataMock.getMermbershipParamsV2)
            .sink(receiveValue: { response in
                expectation.fulfill()
                
                switch response {
                    case .success(let rewards):
                        //ASSERT
                        XCTAssertEqual(20, rewards.data.count)
                    default:
                        XCTExpectFailure()
                }
            })
            .store(in: &subscribe)
        
            wait(for: [expectation], timeout: .infinity)
        }
    }




