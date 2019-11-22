//
//  AuthTests.swift
//  IkouTests
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import XCTest
@testable import Ikou

class AuthTests: XCTestCase {

    var sut: AuthPresenterProtocol!
    var view: AuthViewMock!
    
    override func setUp() {
        super.setUp()
        view = AuthViewMock()
        let interactor = AuthInteractor()
        let router = AuthRouter()
        sut = AuthPresenter(interface: view, interactor: interactor, router: router)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_getCorrectURL(){
        sut.getAuthURL()
        XCTAssertTrue(view.isItGetUrl)
    }
    
    func test_retrieveCorrectStreamIDAndSetToCache(){
        let cacheHelper = CacheHelper()
        let url = "https://somewebsitedomain.com/profiles/76561198876056556/some"
        sut.retrieveSteamIdFrom(url)
        XCTAssertEqual(cacheHelper.get(.steamID), "76561198876056556")
    }
    
    func test_retrieveWrongStreamID(){
        let cacheHelper = CacheHelper()
        cacheHelper.remove(.steamID)
        let url = "https://somewebsitedomain.com/profiles/some/123/421/2121?go_to"
        sut.retrieveSteamIdFrom(url)
        XCTAssertEqual(cacheHelper.get(.steamID), nil)
    }
    
}
class AuthViewMock: AuthViewProtocol{
    var isItGetUrl = false
    var presenter: AuthPresenterProtocol?
    
    func didLoadAuth(url: URL) {
        if let authUrl = URL(string: Constants.API.authUrl.rawValue), authUrl == url{
            isItGetUrl = true
        }
    }
}
