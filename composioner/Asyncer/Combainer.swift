//
//  Combainer.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI
import Combine

struct Combiner {
    func getUser() -> AnyPublisher<[User], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getPost(userID: Int) -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userID)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getComments(postID: Int) -> AnyPublisher<[Comment], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postID)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Comment].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
