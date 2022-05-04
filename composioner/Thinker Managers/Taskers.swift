//
//  Taskers.swift
//  composioner
//
//  Created by Misha Causur on 04.05.2022.
//

import SwiftUI

final class TaskersViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    func fetchImage() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
    }
}

struct Taskers: View {
    @StateObject private var viewModel = TaskersViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Taskers_Previews: PreviewProvider {
    static var previews: some View {
        Taskers()
    }
}
