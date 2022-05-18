//
//  CVMNetworkManager.swift
//  composioner
//
//  Created by Misha Causur on 18.05.2022.
//

final class CVMNetworkManager {
    func getData(with url: URL) async throws -> Data {
        do {
            let response = try await URLSession.shared.data(from: url, delegate: nil)
            return response.0
        } catch {
            throw error
        }
    }
    
    func getDataCont(with url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getHeart(completion: @escaping (_ image: UIImage) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(UIImage(systemName: "heart.fill")!)
        }
    }
    
    func asycHeart() async -> UIImage {
        await withCheckedContinuation { continuation in
            getHeart { image in
                continuation.resume(returning: image)
            }
        }
    }
}
