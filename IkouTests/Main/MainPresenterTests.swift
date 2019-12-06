//
//  MainTests.swift
//  IkouTests
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import XCTest
@testable import Ikou

class MainPresenterTests: XCTestCase {

    var sut: (MainPresenterProtocol & MainOutputInteractorProtocol)!
    var interactor: MainInteractorMock!
    var view: MainViewMock!
    let steamId = "76561198876056556"
    
    override func setUp() {
        super.setUp()
        view = MainViewMock()
        interactor = MainInteractorMock()
        let router = MainRouter()
        sut = MainPresenter(interface: view, router: router, interactor: interactor, steamId: steamId)
        interactor.presenter = sut
    }

    override func tearDown() {
        sut = nil
        interactor = nil
        super.tearDown()
    }
    
    func test_ProfileLoaded() {
        sut.loadProfile()
        XCTAssertTrue(interactor.isLoadedProfile)
        XCTAssertTrue(view.isLoadedProfile)
    }
    func test_OwnedGamesLoaded(){
        sut.loadOwnedGames()
        XCTAssertTrue(interactor.isLoadedOwnedGame)
        XCTAssertTrue(view.isLoadedOwnedGame)
    }
    func test_ErrorLoading(){
        let error = "Error occured while loading data"
        interactor.loadWithError(error: error)
        XCTAssertEqual(view.error, error)
    }

}
class MainViewMock: MainViewProtocol{

    var presenter: MainPresenterProtocol?
    var isLoadedProfile = false
    var isLoadedOwnedGame = false
    var isLoadedFriends = false
    var error: String?
    
    func didLoadProfile() {
        isLoadedProfile = true
    }
    
    func didLoadOwnedGames() {
        isLoadedOwnedGame = true
    }
    
    func didLoadFriends() {
        isLoadedFriends = true
    }
    
    func showError(_ error: String) {
        self.error = error
    }
    
}
class MainInteractorMock: MainInputInteractorProtocol{
    
    var presenter: MainOutputInteractorProtocol?
    var isLoadedProfile = false
    var isLoadedOwnedGame = false
    
    func loadProfile() {
        isLoadedProfile = true
        presenter?.didLoadProfile(profile: nil)
    }
    
    func loadOwnedGames() {
        isLoadedOwnedGame = true
        presenter?.didLoadGames(games: [Game]())
    }
    
    func loadWithError(error: String) {
        presenter?.didLoadWith(error: error)
    }
    func loadFriends() {
        
    }
    func loadProfileOf(friend: Friend, completion: @escaping ((Profile) -> Void)) {
        
    }
    
}
