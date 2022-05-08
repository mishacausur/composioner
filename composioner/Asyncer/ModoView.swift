//
//  ModoView.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI

final class ModoViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    private let combiner = Combiner()
    func fetchCommentsCombiner() {
        
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
