//
//  ContinuationViewModel.swift
//  composioner
//
//  Created by Misha Causur on 18.05.2022.
//

import UIKit

final class ContinuationViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let networker = CVMNetworkManager()
    func getImages() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
            let data = try await networker.getDataCont(with: url)
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
        } catch {
            print(error)
        }
    }
    
    func getHeart() {
        networker.getHeart { [weak self] image in
            self?.image = image
        }
    }
    func heartAsync() async {
        self.image = await networker.asycHeart()
    }
}
