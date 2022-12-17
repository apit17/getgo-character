//
//  CharacterApi.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

protocol CharacterApiProtocol {
    func fetchCharacters(filter: FilterCharacter, completion: (CharacterData?, Error?) -> Void)
}

class CharacterApi: CharacterApiProtocol {

    private let network: AppsCore.Networking.Manager

    init(network: AppsCore.Networking.Manager) {
        self.network = network
    }

    func fetchCharacters(filter: FilterCharacter, completion: (CharacterData?, Error?) -> Void) {
        
    }
}
