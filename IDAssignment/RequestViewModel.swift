//
//  RequestViewModel.swift
//  IDAssignment
//
//  Created by Sanjay Mali on 28/11/23.
//

import Foundation
import Combine
protocol RequestViewModelProtocol : ObservableObject{
    func sendRequest()
    func sendMultipleRequests()
}

class RequestViewModel: RequestViewModelProtocol {
    private let serverService = ServerService()
    private var cancellables: Set<AnyCancellable> = []

    @Published var acknowledgmentMessage: String?
    @Published var chatBotResponse: String?

    func sendRequest() {
        serverService.acknowledgeRequest { success in
            DispatchQueue.main.async {
                if success {
                    self.acknowledgmentMessage = "Request Acknowledged!"
                    print("Response : \(self.acknowledgmentMessage!)")
                } else {
                    self.acknowledgmentMessage = "Request Not Acknowledged!"
                    print("Response : \(self.acknowledgmentMessage!)")
                }
            }
        }
    }

    func sendChatBotRequest() {
        serverService.chatBotResponse { response in
            DispatchQueue.main.async {
                self.chatBotResponse = response
            }
        }
    }

    func sendMultipleRequests() {
        let acknowledgmentPublisher = Future<Bool, Never> { promise in
            self.serverService.acknowledgeRequest { success in
                promise(.success(success))
            }
        }

        let chatBotResponsePublisher = Future<String, Never> { promise in
            self.serverService.chatBotResponse { response in
                promise(.success(response))
            }
        }

        Publishers.CombineLatest(acknowledgmentPublisher, chatBotResponsePublisher)
            .sink { ackSuccess, chatResponse in
                DispatchQueue.main.async {
                    if ackSuccess {
                        self.acknowledgmentMessage = "Requests Acknowledged!"
                    } else {
                        self.acknowledgmentMessage = "Requests Not Acknowledged!"
                    }
                    print("ackSuccess: \(ackSuccess), chatResponse : \(chatResponse)")
                    self.chatBotResponse = chatResponse
                }
            }
            .store(in: &cancellables)
    }
}

