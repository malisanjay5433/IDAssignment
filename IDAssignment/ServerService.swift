//
//  ServerService.swift
//  IDAssignment
//
//  Created by Sanjay Mali on 28/11/23.
//

import Foundation
protocol ServerServiceProtocol {
    func acknowledgeRequest(completion: @escaping (Bool) -> Void)
    func chatBotResponse(completion: @escaping (String) -> Void)
}
class ServerService: ServerServiceProtocol {
    func acknowledgeRequest(completion: @escaping (Bool) -> Void) {
        // Simulate server response delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Simulate server acknowledging the request
            completion(true)
        }
    }
    func chatBotResponse(completion: @escaping (String) -> Void) {
        // Simulate chat bot response delay
        DispatchQueue.global().asyncAfter(deadline: .now() + Double.random(in: 1...5)) {
            // Simulate chat bot response
            let responses = ["How can I assist you?", "Interesting question!", "I'm here to help!"]
            let randomResponse = responses.randomElement() ?? "I didn't understand that."
            completion(randomResponse)
        }
    }
}
