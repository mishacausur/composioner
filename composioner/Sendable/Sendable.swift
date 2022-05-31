//
//  Sendable.swift
//  composioner
//
//  Created by Misha Causur on 31.05.2022.
//

import SwiftUI

actor CurrentUserManager {
    func updateDatabase() {
        
    }
}

final class SendableViewModel: ObservableObject {
    let manager = CurrentUserManager()
}

struct Sendable: View {
    
    @StateObject private var viewModel = SendableViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Sendable_Previews: PreviewProvider {
    static var previews: some View {
        Sendable()
    }
}
