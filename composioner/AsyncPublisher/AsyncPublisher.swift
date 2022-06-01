//
//  AsyncPublisher.swift
//  composioner
//
//  Created by Misha Causur on 02.06.2022.
//

import SwiftUI

final class AsyncPublisherViewModel: ObservableObject {
    
}

struct AsyncPublisher: View {
    
    @StateObject private var viewModel = AsyncPublisherViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AsyncPublisher_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPublisher()
    }
}
