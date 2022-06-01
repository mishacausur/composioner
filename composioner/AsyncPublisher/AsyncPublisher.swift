//
//  AsyncPublisher.swift
//  composioner
//
//  Created by Misha Causur on 02.06.2022.
//

import SwiftUI

actor AsyncPublisherDataManager {
    
    @Published var data: [String] = []
    
    func addData() {
        
    }
    
}

final class AsyncPublisherViewModel: ObservableObject {
    @Published var data: [String] = []
    let manager = AsyncPublisherDataManager()
    
    func start() async {
        
    }
}

struct AsyncPublisher: View {
    
    @StateObject private var viewModel = AsyncPublisherViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.data, id: \.self) {
                    Text($0)
                        .font(.headline.bold())
                }
            }
        }
        .task {
            await viewModel.start()
        }
    }
}

struct AsyncPublisher_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPublisher()
    }
}
