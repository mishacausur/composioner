//
//  TaskGrouperViewModel.swift
//  composioner
//
//  Created by Misha Causur on 15.05.2022.
//

import UIKit

final class TaskGrouperViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let manager = TaskGrouperDataManager()
    
    func getImages() async {
        if let images1 = try? await manager.fetchImagesWithTaskGroup() {
            images.append(contentsOf: images1)
            print(images.count)
        } else {
            print("sorry but there is no images")
        }
    }
}
