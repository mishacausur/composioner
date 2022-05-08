//
//  RingShape.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI

struct RingShape: Shape {
    var percent: Double
    var startAngle: Double
    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            percent
        }
        set {
            percent = newValue
        }
    }
    init(
        percent: Double = 100,
        startAngle: Double = -90
    ) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    static func percentStartAngle(percent: Double, startAngle: Double) -> Double {
        return (percent / 100 * 360) + startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Self.percentStartAngle(percent: percent, startAngle: startAngle)
        return Path { path in
            path.addArc(center: center,
                        radius: radius,
                        startAngle: Angle(degrees: startAngle),
                        endAngle: Angle(degrees: endAngle),
                        clockwise: false)
        }
    }
}
