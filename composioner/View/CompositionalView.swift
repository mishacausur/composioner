//
//  CompositionalView.swift
//  composioner
//
//  Created by Misha Causur on 24.04.2022.
//

import SwiftUI

struct CompositionalView<Content, Item, ID>: View where Content: View, ID: Hashable, Item: RandomAccessCollection {
    var content: (Item.Element) -> Content
    var items: Item
    var id: KeyPath<Item.Element, ID>
    var spacing: CGFloat
    init(items: Item, id: KeyPath<Item.Element, ID>, spacing: CGFloat = 5,@ViewBuilder content: @escaping (Item.Element) -> Content) {
        self.content = content
        self.id = id
        self.items = items
        self.spacing = spacing
    }
    var body: some View {
        LazyVStack(spacing: spacing) {
            
        }
    }
    
    func generateColumns() -> [[Item.Element]]
}

struct CompositionalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
