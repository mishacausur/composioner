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
    let lock = DispatchQueue(label: "com.MyApp.DataClass")
    func randomData(completionHandler: @escaping (_ title: String?) -> Void) {
        lock.async { [weak self] in
            self?.data.append(UUID().uuidString)
            completionHandler(self?.data.randomElement())
        }
    }
}

actor DataActor {
    static let instance = DataActor()
    nonisolated let text = "text"
    private init() { }
    
    var data: [String] = []
    func randomData() -> String? {
            data.append(UUID().uuidString)
            return data.randomElement()
        
    }
    
    nonisolated
    func getString() -> String {
        "new string"
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
                manager.randomData { title in
                    if let data = title {
                        DispatchQueue.main.async {
                            self.text = data
                        }
                    }
                }
            }
        }
    }
}

struct FavouriteView: View {
    let manager = DataClass.instance
    let actor = DataActor.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color.pink.opacity(0.6).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
//            DispatchQueue.global(qos: .background).async {
//                manager.randomData { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
            Task {
                if let title = await actor.randomData() {
                    await MainActor.run(body: {
                        self.text = title
                    })
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
