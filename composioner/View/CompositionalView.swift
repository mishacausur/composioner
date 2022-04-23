//
//  CompositionalView.swift
//  composioner
//
//  Created by Misha Causur on 24.04.2022.
//

import SwiftUI

struct CompositionalView<Content, Item, ID>: View where Content: View, ID: Hashable, Item: RandomAccessCollection, Item.Element: Hashable {
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
            ForEach(generateColumns(), id: \.self) { row in
                
            }
        }
    }
    
    func generateColumns() -> [[Item.Element]] {
        var columns: [[Item.Element]] = []
        var row: [Item.Element] = []
        
        for item in items {
            if row.count == 3 {
                columns.append(row)
                row.removeAll()
                row.append(item)
            } else {
                row.append(item)
            }
        }
        columns.append(row)
        row.removeAll()
        return columns
    }
}

struct CompositionalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
