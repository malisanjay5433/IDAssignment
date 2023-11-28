//
//  ServerService.swift
//  IDAssignment
//
//  Created by Sanjay Mali on 28/11/23.
//

import Foundation
protocol ServerServiceProtocol {
    func acknowledgeRequest(completion: @escaping (Bool) -> Void)
}
class ServerService: ServerServiceProtocol {
    func acknowledgeRequest(completion: @escaping (Bool) -> Void) {
        // Simulate server response delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Simulate server acknowledging the request
            completion(true)
        }
    }
}
