//
//  Location.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public struct Location: Codable {
    public let id: Int
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [String]
    public let url: String
    public let created: String
}
