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
    
    class RouterSpy: Router {
        var routerdQuestionCount: Int {
            return 0
        }
    }
    
    func test_start_withNoQuestion_() {
        let router = RouterSpy()
        let sut = Flow(router: router)
        
        sut.start()
        XCTAssertEqual(router.routerdQuestionCount, 0)
    
    }
}
