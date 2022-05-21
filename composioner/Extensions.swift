//
//  Extensions.swift
//  composioner
//
//  Created by Misha Causur on 21.05.2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    func offset(coordinateSpace: String, offset: @escaping (CGFloat) -> Void) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named(coordinateSpace)).minY
                    
                    Color.clear
                        .preference(key: OfsetKey.self, value: minY)
                        .onPreferenceChange(OfsetKey.self) { value in
                            offset(value)
                        }
                }
            }
    }
}
