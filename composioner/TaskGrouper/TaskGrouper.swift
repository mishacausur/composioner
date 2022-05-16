//
//  TaskGrouper.swift
//  composioner
//
//  Created by Misha Causur on 12.05.2022.
//

import SwiftUI

//struct TaskGrouper: View {
//    @State private var viewModel = TaskGrouperViewModel()
//    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(viewModel.images, id: \.self) { image in
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 150)
//                    }
//                }
//            }
//            .navigationTitle("Task Grouper")
//            .task {
//                await viewModel.getImages()
//            }
//        }
//    }
//}
//
//struct TaskGrouper_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskGrouper()
//    }
//}
