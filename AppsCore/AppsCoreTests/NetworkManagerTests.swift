//
//  NetworkManagerTests.swift
//  AppsCoreTests
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import XCTest
@testable import AppsCore

final class NetworkManagerTests: XCTestCase {

    func test_loadData_whenItCall_itShouldReturnResult() {
        let manager = AppsCore.Networking.Manager()
        let session = NetworkingSessionMock()
        manager.session = session
        let expectation = XCTestExpectation(description: "Called for data")
        let data = Data([1, 2, 3, 3, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    func test_allCharacterPath() {
        let characterListPath = CharacterRoutes.getCharacters(page: 1, name: "rick", status: "alive", species: "human", gender: "male").path
        let characterDetailPath = CharacterRoutes.getCharacterDetail(id: 1).path

        XCTAssertEqual(characterListPath, "character?page=1&name=rick&status=alive&species=human&gender=male")
        XCTAssertEqual(characterDetailPath, "character/1")
    }

}

class NetworkingSessionMock: NetworkSession {
    var data: Data?
    var error: Error?

    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}
