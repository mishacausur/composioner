//
//  TaskGrouper.swift
//  composioner
//
//  Created by Misha Causur on 12.05.2022.
//

import SwiftUI

final class TaskGrouperDataManager {
    func fetchImagesAsycnLet() async -> [UIImage] {
        async let fetchImage1 = fetchImage("https://picsum.photos/300")
        async let fetchImage2 = fetchImage("https://picsum.photos/300")
        async let fetchImage3 = fetchImage("https://picsum.photos/300")
        async let fetchImage4 = fetchImage("https://picsum.photos/300")
    }
    
    private func fetchImage(_ url: String) async throws -> UIImage {
        guard let url = URL(string: url) else { throw URLError(.badURL) }
        do {
            let response = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: response.0) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

final class TaskGrouperViewModel: ObservableObject {
    @Published var images: [UIImage] = []
}
 
struct TaskGrouper: View {
    @State private var viewModel = TaskGrouperViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Grouper")
        }
    }
}

struct TaskGrouper_Previews: PreviewProvider {
    static var previews: some View {
        TaskGrouper()
    }
}
