//
//  Actors.swift
//  composioner
//
//  Created by Misha Causur on 23.05.2022.
//

import SwiftUI

class DataClass {
    static let instance = DataClass()
    private init() { }
    
    var data: [String] = []
    
    func randomData() -> String? {
        self.data.append(UUID().uuidString)
        return data.randomElement()
    }
}

struct HomeView: View {
    let manager = DataClass.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color.mint.opacity(0.6).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
                if let data = manager.randomData() {
                    DispatchQueue.main.async {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct FavouriteView: View {
    let manager = DataClass.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color.pink.opacity(0.6).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
                if let data = manager.randomData() {
                    DispatchQueue.main.async {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct Actors: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            FavouriteView()
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
