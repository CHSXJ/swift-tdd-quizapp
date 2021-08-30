//
//  FlowTests.swift
//  
//
//  Created by cherry p. on 27/8/2564 BE.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTests: XCTestCase {
    
    func test_start_withNoQuestion_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        
        sut.start()
        XCTAssertEqual(router.routerdQuestionCount, 0)
    }
    
    func test_start_withOneQuestion_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        
        sut.start()
        XCTAssertEqual(router.routerdQuestionCount, 1)
    }
    
    class RouterSpy: Router {
        var routerdQuestionCount: Int = 0
        func routeTo(question: String) {
            routerdQuestionCount += 1
        }
    }
    
}
