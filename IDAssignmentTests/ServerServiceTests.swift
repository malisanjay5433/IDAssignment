//
//  File.swift
//  IDAssignmentTests
//
//  Created by Sanjay Mali on 28/11/23.
//

import Foundation
import XCTest
@testable import IDAssignment

class ServerServiceTests: XCTestCase {
    func testAcknowledgment() {
        let expectation = self.expectation(description: "Acknowledgment expectation")

        let serverService: ServerServiceProtocol = ServerService()
        serverService.acknowledgeRequest { success in
            XCTAssertTrue(success)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
