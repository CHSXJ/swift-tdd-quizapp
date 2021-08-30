//
//  Flow.swift
//  
//
//  Created by cherry p. on 27/8/2564 BE.
//

import Foundation

protocol Router {
    func routeTo(question: String)
}

class Flow {
    let router: Router
    let questions: [String]
    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if !questions.isEmpty {
            router.routeTo(question: "")
        }
    }
}
