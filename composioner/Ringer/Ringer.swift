//
//  Ringer.swift
//  composioner
//
//  Created by Misha Causur on 08.05.2022.
//

import SwiftUI

struct Ringer: View {
    var body: some View {
        ZStack {
            Ring(lineWidth: 50, backgroundColor: .red.opacity(0.2), foregroundColor: .red, percentage: 70)
                .frame(width: 300, height: 300)
        }
    }
}

struct Ringer_Previews: PreviewProvider {
    static var previews: some View {
        Ringer()
            .preferredColorScheme(.dark)
    }
}
