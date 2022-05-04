//
//  Taskers.swift
//  composioner
//
//  Created by Misha Causur on 04.05.2022.
//

import SwiftUI

final class TaskersViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    func fetchImage() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
            let response = try await URLSession.shared.data(from: url, delegate: nil)
            self.image = UIImage(data: response.0)
        } catch (let error) {
            print(error)
        }
    }
    func fetchImage2() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
            let response = try await URLSession.shared.data(from: url, delegate: nil)
            self.image2 = UIImage(data: response.0)
        } catch (let error) {
            print(error)
        }
    }
}

struct Taskers: View {
    @StateObject private var viewModel = TaskersViewModel()
    var body: some View {
        VStack(spacing: 120) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchImage()
            }
            Task {
                await viewModel.fetchImage2()
            }
        }
    }
}

struct Taskers_Previews: PreviewProvider {
    static var previews: some View {
        Taskers()
    }
}
