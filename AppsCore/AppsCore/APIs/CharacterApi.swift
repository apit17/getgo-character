//
//  CharacterApi.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public protocol CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: @escaping (CharacterData?, Error?) -> Void)
    func fetchCharacter(id: Int, completion: @escaping (Character?, Error?) -> Void)
}

public class CharacterApi: CharacterApiProtocol {

    private let network: NetworkManager

    public init(network: NetworkManager) {
        self.network = network
    }


    /// API Method for fetching list of characters
    /// - Parameters:
    ///   - filter: Filter paramater that use for filtering characters
    ///   - completion: Return closures of characters model and error when the request completed
    public func fetchCharacters(filter: FilterCharacter, completion: @escaping (CharacterData?, Error?) -> Void) {
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
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }


    /// API method for fetching detail character
    /// - Parameters:
    ///   - id: ID of chracter that use for get the detail
    ///   - completion: Return closures of character model and error when the request completed
    public func fetchCharacter(id: Int, completion: @escaping (Character?, Error?) -> Void) {
        let url = CharacterRoutes.getCharacter(id: id).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(Character.self, from: value)
                    completion(decoded, nil)
                } catch {
                    print("Failed to decode JSON")
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

}
