//
//  LocationApiTests.swift
//  AppsCoreTests
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import XCTest
@testable import AppsCore

final class LocationApiTests: XCTestCase {

    func test_fetchLocations_whenHasResponse_shouldReturnModel() {
        let api = LocationApiSuccessSpy()
        api.fetchLocations(page: 1, name: "earth") { result, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(result?.info)
            XCTAssertNotNil(result?.results)
            XCTAssertEqual(result?.results.first?.name, "Earth (C-137)")
        }
    }

    func test_fetchLocations_whenHasError_shouldReturnError() {
        let api = LocationApiErrorSpy()
        api.fetchLocations(page: 1, name: "rick") { result, error in
            XCTAssertNotNil(error, "Error should be nil")
            XCTAssertNil(result)
        }
    }
}

class LocationApiSuccessSpy: LocationApiProtocol {
    func fetchLocations(page: Int, name: String?, completion: (LocationData?, Error?) -> Void) {
        let data = Data(locationsJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(LocationData.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }

    func fetchLocation(id: Int, completion: @escaping (Location?, Error?) -> Void) {
        let data = Data(locationJson.utf8)
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Location.self, from: data)
            completion(decoded, nil)
        } catch {
            completion(nil, ApiError())
        }
    }
}

class LocationApiErrorSpy: LocationApiProtocol {
    func fetchLocations(page: Int, name: String?, completion: (LocationData?, Error?) -> Void) {
        completion(nil, ApiError())
    }

    func fetchLocation(id: Int, completion: @escaping (Location?, Error?) -> Void) {
        completion(nil, ApiError())
    }
}
