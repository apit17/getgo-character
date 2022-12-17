//
//  CharacterApiTests.swift
//  AppsCoreTests
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import XCTest
@testable import AppsCore

final class CharacterApiTests: XCTestCase {

    func test_fetchCharacters_whenHasResponse_shouldReturnModel() {
        let api = CharacterApiSuccessSpy()
        let filter = FilterCharacter(page: 1)
        api.fetchCharacters(filter: filter) { result, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(result?.info)
            XCTAssertNotNil(result?.results)
        }
    }

    func test_fetchCharacters_whenHasError_shouldReturnError() {
        let api = CharacterApiErrorSpy()
        let filter = FilterCharacter(page: 1)
        api.fetchCharacters(filter: filter) { result, error in
            XCTAssertNotNil(error, "Error should be nil")
            XCTAssertNil(result)
        }
    }
}

class CharacterApiSuccessSpy: CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: (CharacterData?, Error?) -> Void) {
        let characterData = CharacterData(info: PageInfo(count: 100,
                                                         pages: 1,
                                                         nextUrl: "url"),
                                          results: [
                                            Character(id: 1,
                                                      name: "Rick",
                                                      species: "Human",
                                                      image: "image")])
        completion(characterData, nil)
    }
}

class CharacterApiErrorSpy: CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: (CharacterData?, Error?) -> Void) {
        completion(nil, ApiError())
    }
}

struct ApiError: Error {
}
