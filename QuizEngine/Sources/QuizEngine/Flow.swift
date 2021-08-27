//
//  Flow.swift
//  
//
//  Created by cherry p. on 27/8/2564 BE.
//

import Foundation

protocol Router {}

class Flow {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        
    }
}
