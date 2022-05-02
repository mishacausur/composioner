//
//  Asyncer.swift
//  composioner
//
//  Created by Misha Causur on 02.05.2022.
//
import SwiftUI
import Combine

class AsyncerViewModel: ObservableObject {
    @Published var dataArray: [String] = []
}

struct Asyncer: View {
@StateObject private var viewModel = AsyncerViewModel()
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
    }
}

struct Asyncer_Previews: PreviewProvider {
    static var previews: some View {
        Asyncer()
    }
}
