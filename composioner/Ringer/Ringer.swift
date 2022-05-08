//
//  Ringer.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI

struct Ringer: View {
    @State var percentage1: Double = 0
    @State var percentage2: Double = 0
    @State var percentage3: Double = 0
    var body: some View {
        ZStack {
            Ring(lineWidth: 30, backgroundColor: .cyan.opacity(0.2), foregroundColor: .cyan, percentage: percentage1)
                .frame(width: 140, height: 140)
                .onTapGesture {
                    percentage1 = 80
                }
            Ring(lineWidth: 30, backgroundColor: .green.opacity(0.2), foregroundColor: .green, percentage: percentage2)
                .frame(width: 220, height: 220)
                .onTapGesture {
                    percentage2 = 100
                }
            Ring(lineWidth: 30, backgroundColor: .red.opacity(0.2), foregroundColor: .red, percentage: percentage3)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    percentage3 = 65
                }
        }
    }
}

struct Ringer_Previews: PreviewProvider {
    static var previews: some View {
        Ringer()
            .preferredColorScheme(.dark)
    }
}
