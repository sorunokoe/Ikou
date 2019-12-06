//
//  AuthTests.swift
//  IkouTests
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import XCTest
@testable import Ikou

class AuthPresenterTests: XCTestCase {

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
        view = nil
        super.tearDown()
    }
    
    func test_getCorrectURL(){
        sut.getAuthURL()
        XCTAssertTrue(view.isItGetUrl)
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
