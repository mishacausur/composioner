//
//  ContentView.swift
//  composioner
//
//  Created by Misha Causur on 24.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                CompositionalView(items: 1...15, id: \.self) { item in
                    ZStack {
                        Rectangle()
                            .fill(.red)
                        Text("\(item)")
                            .font(.title.bold())
                    }
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
