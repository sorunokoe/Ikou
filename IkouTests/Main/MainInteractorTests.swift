//
//  MainNetworkTests.swift
//  IkouTests
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import XCTest
@testable import Ikou

class MainInteractorTests: XCTestCase {

    var sut: MainInputInteractorProtocol!
    let steamId = "76561198876056556"
    
    override func setUp() {
        super.setUp()
        sut = MainInteractor()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_LoadProfile(){
        let expect = expectation(description: "Load Profile Steam ID")
        let presenter = MainPresenterMock(expectation: expect)
        sut.presenter = presenter
        sut.loadProfile(steamId: steamId)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(presenter.profile)
    }
    func test_LoadOwnedGames(){
        let expect = expectation(description: "Load Owned Games Steam ID")
        let presenter = MainPresenterMock(expectation: expect)
        sut.presenter = presenter
        sut.loadOwnedGames(steamId: steamId)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.isLoadedGames)
    }
    
}
class MainPresenterMock: MainOutputInteractorProtocol{
    
    var profile: Profile?
    var isLoadedGames = false
    var expectation: XCTestExpectation!
    
    init(expectation: XCTestExpectation){
        self.expectation = expectation
    }
    
    func didLoadProfile(profile: Profile?) {
        self.profile = profile
        expectation.fulfill()
    }
    
    func didLoadGames(games: [Game]) {
        isLoadedGames = true
        expectation.fulfill()
    }
    
    func didLoadWith(error: String) {
        expectation.fulfill()
    }
}
