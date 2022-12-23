//
//  CharacterViewControllerTests.swift
//  getgoTests
//
//  Created by Apit Gilang Aprida on 19/12/22.
//

import XCTest
import AppsCore
@testable import getgo

final class CharacterViewControllerTests: XCTestCase {

    func test_dependency_shouldNotNil() {
        let sut = CharacterViewController()
        sut.viewModel = CharacterViewModel(api: MockCharacterApi())
        sut.loadView()
        XCTAssertNotNil(sut.collectionView)
        XCTAssertNotNil(sut.viewModel)
    }

}

class MockCharacterApi: CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: @escaping (CharacterData?, Error?) -> Void) {
        completion(nil, nil)
    }

    func fetchCharacter(id: Int, completion: @escaping (Character?, Error?) -> Void) {
        completion(nil, nil)
    }

}
