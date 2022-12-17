//
//  Helpers.swift
//  AppsCoreTests
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation
import AppsCore

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

struct ApiError: Error {
}
