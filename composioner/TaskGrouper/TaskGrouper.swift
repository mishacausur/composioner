//
//  TaskGrouper.swift
//  composioner
//
//  Created by Misha Causur on 12.05.2022.
//

import SwiftUI

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
