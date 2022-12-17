//
//  CharacterApi.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

protocol CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: @escaping (CharacterData?, Error?) -> Void)
}

class CharacterApi: CharacterApiProtocol {

    private let network: NetworkManager

    init(network: NetworkManager) {
        self.network = network
    }

    func fetchCharacters(filter: FilterCharacter, completion: @escaping (CharacterData?, Error?) -> Void) {
        let url = CharacterRoutes.getCharacters(filter: filter).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(CharacterData.self, from: value)
                    completion(decoded, nil)
                } catch {
                    print("Failed to decode JSON")
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
