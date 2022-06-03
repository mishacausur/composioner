//
//  AsyncPublisher.swift
//  composioner
//
//  Created by Misha Causur on 02.06.2022.
//

import SwiftUI
import Combine

class AsyncPublisherDataManager {
    
    @Published var data: [String] = []
    
    func addData() async {
        data.append("Misha")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        data.append("Jenny")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        data.append("Pussy")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        data.append("Cosa")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        data.append("Pepe")
    }
    
}

final class AsyncPublisherViewModel: ObservableObject {
    @MainActor @Published var data: [String] = []
    let manager = AsyncPublisherDataManager()
    var cancellables = Set<AnyCancellable>()
    init() {
        addSubscibers()
    }
    
    private func addSubscibers() {
        
        Task {
            for await value in manager.$data.values {
                await MainActor.run(body: {
                    self.data = value
                })
            }
        }
    }
    
    private func addSubscibersCombine() {
        Task {
            manager.$data
                .receive(on: DispatchQueue.main, options: nil)
                .sink { array in
                    self.data = array
                }
                .store(in: &cancellables)
        }
    }
    
    func start() async {
        await manager.addData()
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
