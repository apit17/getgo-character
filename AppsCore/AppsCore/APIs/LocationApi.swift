//
//  LocationApi.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public protocol LocationApiProtocol {
    func fetchLocations(page: Int, name: String?, completion: @escaping (LocationData?, Error?) -> Void)
    func fetchLocation(id: Int, completion: @escaping (Location?, Error?) -> Void)
}

public class LocationApi: LocationApiProtocol {

    private let network: NetworkManager

    public init(network: NetworkManager) {
        self.network = network
    }

    /// API Method for fetching list of locations
    /// - Parameters:
    ///   - page: Number of page for requesting specific page of locations
    ///   - name: Name of location that use for searching the location
    ///   - completion: Return closures of locations model and error when the request completed
    public func fetchLocations(page: Int, name: String?, completion: @escaping (LocationData?, Error?) -> Void) {
        let url = LocationRoutes.getLocations(page: page, name: name).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(LocationData.self, from: value)
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


    /// API Method for fethcing detail location
    /// - Parameters:
    ///   - id: ID of location that use for get the detail
    ///   - completion: Return closures of location model and error when the request completed
    public func fetchLocation(id: Int, completion: @escaping (Location?, Error?) -> Void) {
        let url = LocationRoutes.getLocation(id: id).url
        network.loadData(from: url) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(Location.self, from: value)
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
