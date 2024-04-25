//
//  UsersTableVCTests.swift
//  viperexampleTests
//
//  Created by Victor Manuel Lagunas on 2024/04/25.
//

import Foundation
import XCTest
import UIKit
@testable import viperexample



class UsersTableVCTests: XCTestCase {
    
    var viewController:UserViewController!
        
    override func setUp(){
        super.setUp()
        
        viewController = UserViewController()
        viewController.loadViewIfNeeded() //
    
    }
    
    func test_TableIsHiddenWhenUsersIsEmpty() {
        let expectation = XCTestExpectation(description: "Table doesnt have users, then table is hidden")
        DispatchQueue.main.async {

            XCTAssertTrue(self.viewController.isTableViewHidden,"The table is empty, then hidden.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_TableNotIsHiddenWhenUsersIsEmpty() {
        let users = [User(name: "Enoc Bahena"), User(name: "Rene")]
        
        let expectation = XCTestExpectation(description: "Table have users, then table not is hidden")
        self.viewController.update(with: users)
        
        DispatchQueue.main.async {
        
            XCTAssertFalse(self.viewController.isTableViewHidden,"The table fetch users then not hidden.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    
    func test_LabelIsHiddenWhenStartApplication(){
        let expectation = XCTestExpectation(description: "User Label is not hidden when start the application")
        DispatchQueue.main.async {

            XCTAssertTrue(self.viewController.isLableViewHidden,"The label is hidden.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_LabelNotIsHiddenWhenUsersIsEmpty(){
        self.viewController.update(with: "problema")
        let expectation = XCTestExpectation(description: "User Label is not hidden when table doesnt have data or has a problem")
        DispatchQueue.main.async {

            XCTAssertFalse(self.viewController.isLableViewHidden,"The label not is hidden.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_LabelIsHiddenWhenUsersIsFetch(){
        self.viewController.update(with: [User(name: "Enoc")])
        let expectation = XCTestExpectation(description: "User Label is hidden when table has data")
        DispatchQueue.main.async {

            XCTAssertTrue(self.viewController.isLableViewHidden,"The label is hidden.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
