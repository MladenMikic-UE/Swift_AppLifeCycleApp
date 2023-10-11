//
//  ApplicationLifeCycleManagerTests.swift
//  Swift_AppLifeCycleTests
//
//  Created by MladenMikic on 11.10.2023.
//

@testable import Swift_AppLifeCycle
import XCTest

final class ApplicationLifeCycleManagerTests: XCTestCase {

    private let appLifeCycleManager: ApplicationLifeCycleManager = .init()
    
    func testLifeCycleCount() throws {
        // Add the new state , review all cases and update the tests manually.
        XCTAssertEqual(ApplicationLifeCycleState.allCases.count, 6)
    }
    
    func testAllStatesChange() throws {
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 4 seconds for the app to start and finish all relevant lifecycle steps.")], timeout: 4.0)
        ApplicationLifeCycleState.allCases.forEach { applicationLifeCycleState in
            appLifeCycleManager.post(newState: applicationLifeCycleState)
            _ = XCTWaiter.wait(for: [expectation(description: "Wait for 2 seconds for the notification to change the internal property.")], timeout: 2.0)
            XCTAssertTrue(appLifeCycleManager.state == applicationLifeCycleState)
        }
    }

}
