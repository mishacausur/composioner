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

struct Awaiter {
    func getUsers() async -> Result<[User], Error> {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            let response = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: response.0)
            return .success(users)
        } catch(let error) {
            return .failure(error)
        }
    }
    
    func getPosts(userID: Int) async -> Result<[Post], Error> {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userID)")!
            let response = try await URLSession.shared.data(from: url)
            let posts = try JSONDecoder().decode([Post].self, from: response.0)
            return .success(posts)
        } catch(let error) {
            return .failure(error)
        }
    }
    
    func getComments(postID: Int) async -> Result<[Comment], Error> {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postID)")!
            let response = try await URLSession.shared.data(from: url)
            let comments = try JSONDecoder().decode([Comment].self, from: response.0)
            return .success(comments)
        } catch(let error) {
            return .failure(error)
        }
    }
}
