//
//  GlobalActors.swift
//  composioner
//
//  Created by Misha Causur on 25.05.2022.
//

import SwiftUI

final class GlobalActorViewModel: ObservableObject {
    @MainActor @Published var data: [String] = []
    let manager = FirstGlobalActor.shared
    
    @FirstGlobalActor
    func getData() async {
        let data = await manager.getDataFromDB()
        await MainActor.run(body: {
            self.data = data
        })
    }
    
    @MainActor
    func getMainData() {
        
    }
}

struct GlobalActors: View {
    @StateObject private var viewModel = GlobalActorViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.data, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
    }
}

struct GlobalActors_Previews: PreviewProvider {
    static var previews: some View {
        GlobalActors()
    }
}
