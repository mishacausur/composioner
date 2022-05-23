//
//  Actors.swift
//  composioner
//
//  Created by Misha Causur on 23.05.2022.
//

import SwiftUI



struct Actors: View {
    var body: some View {
        TabView {
            Text("Hi")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Hi again")
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
    }
}

struct Actors_Previews: PreviewProvider {
    static var previews: some View {
        Actors()
    }
}
