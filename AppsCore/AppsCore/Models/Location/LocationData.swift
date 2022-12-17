//
//  LocationData.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public struct LocationData: Codable {
    public let info: PageInfo
    public let results: [Location]
}
