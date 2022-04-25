//
//  ImageFetcher.swift
//  composioner
//
//  Created by Misha Causur on 24.04.2022.
//

import SwiftUI

class ImageFetcher: ObservableObject {
    @Published var fetchImages: [ImageModel]?
    @Published var currentPage: Int = 0
    @Published var startPagination: Bool = false
    @Published var endPagination: Bool = false
    
    init() {
        updateImages()
    }
    
    func updateImages() {
        currentPage += 1
        Task {
            do {
               try await fetchImages()
            } catch {
               assertionFailure("Invalid data recieved")
            }
        }
    }
    
    func fetchImages() async throws {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=\(currentPage)&limit=30") else { return }
        let response = try await URLSession.shared.data(from: url)
        let images = try JSONDecoder().decode([ImageModel].self, from: response.0).compactMap({ item -> ImageModel? in
            let imageID = item.id
            let sizedURL = "https://picsum.photos/id/\(imageID)/500/500"
            return .init(id: imageID, download_url: sizedURL)
        })
        await MainActor.run(body: {
            if fetchImages == nil { fetchImages = [] }
            fetchImages?.append(contentsOf: images)
            endPagination = (fetchImages?.count ?? 0) > 100
            startPagination = false
        })
    }
}
