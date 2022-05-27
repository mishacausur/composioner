//
//  GlobalActorVM.swift
//  composioner
//
//  Created by Misha Causur on 27.05.2022.
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
