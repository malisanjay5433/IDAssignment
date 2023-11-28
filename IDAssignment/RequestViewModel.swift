//
//  RequestViewModel.swift
//  IDAssignment
//
//  Created by Sanjay Mali on 28/11/23.
//

import Foundation

protocol RequestViewModelProtocol {
    func sendRequest()
}

class RequestViewModel: RequestViewModelProtocol {
    private let serverService: ServerServiceProtocol

    init(serverService: ServerServiceProtocol) {
        self.serverService = serverService
    }

    func sendRequest() {
        serverService.acknowledgeRequest { success in
            // Handle the acknowledgment, e.g., update UI or perform further actions
            if success {
                print("Request Acknowledged!")
            } else {
                print("Request Not Acknowledged!")
            }
        }
    }
}
