//
//  Ring.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI

struct Ring: View {
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percentage: Double
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
            }
            .animation(Animation.easeIn(duration: 1))
            .padding()
        }
    }
}
