//
//  EpisodeApiTests.swift
//  AppsCoreTests
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import XCTest
@testable import AppsCore

final class EpisodeApiTests: XCTestCase {

    func test_fetchEpisodes_whenHasResponse_shouldReturnModel() {
        let api = EpisodeApiSuccessSpy()
        api.fetchEpisodes(page: 1, name: "earth") { result, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(result?.info)
            XCTAssertNotNil(result?.results)
            XCTAssertEqual(result?.results.first?.name, "Pilot")
        }
    }

    func test_fetchEpisodes_whenHasError_shouldReturnError() {
        let api = EpisodeApiErrorSpy()
        api.fetchEpisodes(page: 1, name: "rick") { result, error in
            XCTAssertNotNil(error, "Error should be nil")
            XCTAssertNil(result)
        }
    }
}

class EpisodeApiSuccessSpy: EpisodeApiProtocol {
    func fetchEpisodes(page: Int, name: String?, completion: (EpisodeData?, Error?) -> Void) {
        let data = Data(episodesJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(EpisodeData.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }

    func fetchEpisode(id: Int, completion: @escaping (Episode?, Error?) -> Void) {
        let data = Data(episodeJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Episode.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }
}

class EpisodeApiErrorSpy: EpisodeApiProtocol {
    func fetchEpisodes(page: Int, name: String?, completion: (EpisodeData?, Error?) -> Void) {
        completion(nil, ApiError())
    }

    func fetchEpisode(id: Int, completion: @escaping (Episode?, Error?) -> Void) {
        completion(nil, ApiError())
    }
}
