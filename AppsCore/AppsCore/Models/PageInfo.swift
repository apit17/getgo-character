//
//  PageInfo.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public struct PageInfo: Codable {
    public let count: Int
    public let pages: Int
    public let nextUrl: String
    public var prevUrl: String?

    enum CodingKeys: String, CodingKey {
        case count, pages
        case nextUrl = "next"
        case prevUrl = "prev"
    }
}
