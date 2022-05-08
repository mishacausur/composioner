//
//  Modo.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import Foundation
import SwiftUI

struct User: Decodable {
    let id: Int
    let name: String
}

struct Post: Decodable {
    let id: Int
    let userId: Int
    let title: String
}

struct Comment: Decodable, Identifiable {
    let id: Int
    let postId: Int
    let email: String
}

enum APIError: Error {
    case emptyUsers
    case emptyPosts
    case emptyComments
}
