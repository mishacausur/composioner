//
//  AsyncLet.swift
//  composioner
//
//  Created by Misha Causur on 09.05.2022.
//

import SwiftUI

struct AsyncLet: View {
    
    @State private var images: [UIImage] = []
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/300")!
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Async Let")
            .onAppear {
               Task {
                   do {
                       let image = try await fetchImage()
                       self.images.append(image)
                       
                       let image1 = try await fetchImage()
                       self.images.append(image1)
                       
                       let image2 = try await fetchImage()
                       self.images.append(image2)
                       
                       let image3 = try await fetchImage()
                       self.images.append(image3)
                       
                   } catch {
                       
                   }
               }
            }
        }
    }
    
    func fetchImage() async throws -> UIImage {
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

struct AsyncLet_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLet()
    }
}
