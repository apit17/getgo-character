//
//  EpisodeApi.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public protocol EpisodeApiProtocol {
    func fetchEpisodes(page: Int, name: String?, completion: @escaping (EpisodeData?, Error?) -> Void)
    func fetchEpisode(id: Int, completion: @escaping (Episode?, Error?) -> Void)
}

public class EpisodeApi: EpisodeApiProtocol {

    private let network: NetworkManager

    public init(network: NetworkManager) {
        self.network = network
    }

    /// API Method for fetching list of episodes
    /// - Parameters:
    ///   - page: Number of page for requesting specific page of episodes
    ///   - name: Name of location that use for searching the episode
    ///   - completion: Return closures of episodes model and error when the request completed
    public func fetchEpisodes(page: Int, name: String?, completion: @escaping (EpisodeData?, Error?) -> Void) {
        let url = EpisodeRoutes.getEpisodes(page: page, name: name).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(EpisodeData.self, from: value)
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

    /// API Method for fethcing detail episode
    /// - Parameters:
    ///   - id: ID of episode that use for get the detail
    ///   - completion: Return closures of episode model and error when the request completed
    public func fetchEpisode(id: Int, completion: @escaping (Episode?, Error?) -> Void) {
        let url = EpisodeRoutes.getEpisode(id: id).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(Episode.self, from: value)
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
