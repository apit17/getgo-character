//
//  PageInfo.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

struct PageInfo: Codable {
    let count: Int
    let pages: Int
    let nextUrl: String
    var prevUrl: String?

    enum CodingKeys: String, CodingKey {
        case count, pages
        case nextUrl = "next"
        case prevUrl = "prev"
    }
}
