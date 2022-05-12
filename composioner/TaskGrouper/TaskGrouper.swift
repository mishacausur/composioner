//
//  TaskGrouper.swift
//  composioner
//
//  Created by Misha Causur on 12.05.2022.
//

import SwiftUI

final class TaskGrouperDataManager {
    func fetchImagesAsycnLet() async throws -> [UIImage] {
        async let fetchImage1 = fetchImage("https://picsum.photos/300")
        async let fetchImage2 = fetchImage("https://picsum.photos/300")
        async let fetchImage3 = fetchImage("https://picsum.photos/300")
        async let fetchImage4 = fetchImage("https://picsum.photos/300")
        
        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
        return [image1, image2, image3, image4]
    }
    
    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        return try await withThrowingTaskGroup(of: UIImage.self) { group in
            var images: [UIImage] = []
            group.addTask {
                try await self.fetchImage("https://picsum.photos/300")
            }
            group.addTask {
                try await self.fetchImage("https://picsum.photos/300")
            }
            group.addTask {
                try await self.fetchImage("https://picsum.photos/300")
            }
            group.addTask {
                try await self.fetchImage("https://picsum.photos/300")
            }
            
            for try await result in group {
                images.append(result)
            }
            return images
        }
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
    let manager = TaskGrouperDataManager()
    
    func getImages() async {
        if let images1 = try? await manager.fetchImagesWithTaskGroup() {
            print(images1.count)
        } else {
            print("sorry but no images")
        }
    }
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
            .task {
                await viewModel.getImages()
            }
        }
    }
}

struct TaskGrouper_Previews: PreviewProvider {
    static var previews: some View {
        TaskGrouper()
    }
}
