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
        let sut = makeSUT(question: "Q1", options: [])
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_redersOptions() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_redersOptionText() {
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 1), "A2")
    }
    
    func test_optionSelected_notifiesDeleget() {
        var recievedAnswer = ""
        let sut = makeSUT(options: ["A1"]) {
            recievedAnswer = $0
        }
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
        
        XCTAssertEqual(recievedAnswer, "A1")
    }
    
    // MARK: - Helpers
    func makeSUT(question: String = "",
                 options: [String],
                 selection: @escaping (String) -> Void = { _ in }) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options, selection: selection)
        _ = sut.view
        return sut
    }
}

private extension UITableView {
    
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
}
