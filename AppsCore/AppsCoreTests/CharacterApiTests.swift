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
            XCTAssertEqual(result?.results.first?.name, "Rick Sanchez")
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
        let data = Data(charactersJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(CharacterData.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }

    func fetchCharacter(id: Int, completion: @escaping (Character?, Error?) -> Void) {
        let data = Data(charactersJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Character.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }
}

class CharacterApiErrorSpy: CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: (CharacterData?, Error?) -> Void) {
        completion(nil, ApiError())
    }

    func fetchCharacter(id: Int, completion: @escaping (Character?, Error?) -> Void) {
        completion(nil, ApiError())
    }
}
