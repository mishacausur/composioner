//
//  ContentView.swift
//  composioner
//
//  Created by Misha Causur on 24.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var imageFetcher: ImageFetcher = .init()
    var body: some View {
        NavigationView {
            ScrollView {
                if let images = imageFetcher.fetchImages {
                    CompositionalView(items: images, id: \.id) { item in
                        ZStack {
                            Rectangle()
                                .fill(.red)
                            Text("\(item)")
                                .font(.title.bold())
                        }
                    }
                    .padding()
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Composioner".uppercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
