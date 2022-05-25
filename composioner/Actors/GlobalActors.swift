//
//  GlobalActors.swift
//  composioner
//
//  Created by Misha Causur on 25.05.2022.
//

import SwiftUI

final class GlobalActorViewModel: ObservableObject {
    @Published var data: [String] = []
}

struct GlobalActors: View {
    @StateObject private var viewModel = GlobalActorViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.data, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
    }
}

struct GlobalActors_Previews: PreviewProvider {
    static var previews: some View {
        GlobalActors()
    }
}
