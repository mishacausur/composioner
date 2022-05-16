//
//  ContinuationView.swift
//  composioner
//
//  Created by Misha Causur on 16.05.2022.
//

import SwiftUI

final class CVMNetworkManager {
    func getData(with url: URL) async throws -> Data {
        do {
            let response = try await URLSession.shared.data(from: url, delegate: nil)
            return response.0
        } catch {
            throw error
        }
    }
}

final class ContinuationViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let networker = CVMNetworkManager()
    func getImages() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
            let data = try await networker.getData(with: url)
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
        } catch {
            error
        }
    }
}

struct ContinuationView: View {
    @StateObject private var viewModel = ContinuationViewModel()
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.getImages()
        }
    }
}

struct ContinuationView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationView()
    }
}
