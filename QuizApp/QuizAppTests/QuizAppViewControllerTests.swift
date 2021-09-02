//
//  QuizAppTests.swift
//  QuizAppTests
//
//  Created by Ch Puttarukkul on 2/9/2564 BE.
//

import XCTest
@testable import QuizApp

class QuizAppViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_renderHeaderText() {
        let sut = QuestionViewController(question: "Q1", options: [])
        _ = sut.view
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withNoOptions_redersZeroOptions() {
        let sut = QuestionViewController(question: "Q1", options: [])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withNoOptions_redersOneOption() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withNoOptions_redersOneOptionText() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"])
        _ = sut.view
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
}
