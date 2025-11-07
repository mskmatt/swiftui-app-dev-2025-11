//
//  VideoModel.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import Foundation

struct VideoModel: Identifiable, Codable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: AuthorModel

    var publishedAtDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: publishedAt)
    }
}

struct AuthorModel: Identifiable, Codable {
    let id: String
    let name: String
}
