//
//  ModoView.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//
import Combine
import SwiftUI

final class ModoViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var acomments: [Comment] = []
    private let combiner = Combiner()
    private var cancellables = Set<AnyCancellable>()
    private let asyncer = Awaiter()
    func fetchCommentsCombiner() {
        combiner.getUser().flatMap { [weak self] users -> AnyPublisher<[Post], Error> in
            if let user = users.first, let self = self {
                return self.combiner.getPost(userID: user.id)
            } else {
                return Fail(error: APIError.emptyUsers).eraseToAnyPublisher()
            }
        }.flatMap { [weak self] posts -> AnyPublisher<[Comment], Error> in
            if let post = posts.last, let self = self {
                return self.combiner.getComments(postID: post.id)
            } else {
                return Fail(error: APIError.emptyPosts).eraseToAnyPublisher()
            }
        }.sink { result in
            switch result {
            case .finished:
                print("completed")
            case .failure(let error):
                print(error.localizedDescription)
            }
        } receiveValue: { [weak self] comments in
            DispatchQueue.main.async {
                self?.comments = comments
            }
        }.store(in: &cancellables)
    }
    
    func fetchCommentsAsyncer() {
        Task(priority: .background) {
            let users: Result<[User], Error> = await asyncer.getUsers()
            guard case .success(let users) = users, let user = users.first else { return }
            let posts  = await asyncer.getPosts(userID: user.id)
            guard case .success(let posts) = posts, let post = posts.first else { return }
            let comments = await asyncer.getComments(postID: post.id)
            guard case .success(let comments) = comments else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.acomments = comments
            }
        }
    }
}

struct ModoView: View {
    @ObservedObject var viewModel = ModoViewModel()
    var body: some View {
        List(viewModel.comments) { comment in
            Text(comment.email)
        }
        .onAppear {
            viewModel.fetchCommentsCombiner()
        }
    }
}

struct ModoView_Previews: PreviewProvider {
    static var previews: some View {
        ModoView()
    }
}
