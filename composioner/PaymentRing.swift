//
//  PaymentRing.swift
//  composioner
//
//  Created by Misha Causur on 10.05.2022.
//

import SwiftUI

struct PaymentRing: View {
    @State private var frameSize = UIScreen.main.bounds.width - 120
    @State private var current: CGFloat = 0
    @State private var value: Double = 0
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(.secondary, style: StrokeStyle(lineWidth: 40, lineCap: .butt, lineJoin: .round))
                    .frame(width: frameSize, height: frameSize)
                
                Circle()
                    .trim(from: 0, to: current)
                    .stroke(.green, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                    .frame(width: frameSize, height: frameSize)
                    .rotationEffect(.init(degrees: -90))
                
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                    .offset(x: frameSize / 2)
                    .rotationEffect(.init(degrees: value))
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                HStack {
                    Text("$")
                    Text(String(format: "%.0f", current * 1000))
                }
                .font(.largeTitle)
            }
        }
    }
    
    func onDrag(value: DragGesture.Value) {
        let radianVector = CGVector(dx: value.location.x, dy: value.location.y)
        let radian = atan2(radianVector.dy - 20, radianVector.dx - 20)
        var angleValue = radian * 180 / .pi
        
        if angleValue < 0 {
            angleValue = 360 + angleValue
        }
        
        withAnimation(Animation.linear(duration: 0.25)) {
            let current = angleValue / 360
            self.current = current
            self.value = Double(angleValue)
        }
    }
}

struct PaymentRing_Previews: PreviewProvider {
    static var previews: some View {
        PaymentRing()
            .preferredColorScheme(.dark)
    }
}
