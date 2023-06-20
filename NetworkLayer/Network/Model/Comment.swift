//
//  Comment.swift
//  NetworkLayer
//
//  Created by Baris on 20.06.2023.
//
import Foundation

// MARK: - WelcomeElement
struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Comments = [Comment]

