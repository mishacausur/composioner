//
//  ExpertoView.swift
//  composioner
//
//  Created by Misha Causur on 06.05.2022.
//

import SwiftUI

struct ExpertoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ZStack {
                        Circle()
                            .stroke(.white, lineWidth: 14)
                            .padding()
                            .rotationEffect(Angle(degrees: 270))
                            .opacity(0.4)
                        Circle()
                            .trim(from: 0, to: 0.74)
                            .stroke(style: StrokeStyle(lineWidth: 14.0, lineCap: .round, lineJoin: .round))
                            .padding()
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: 270))
                        Image(systemName: "checkmark")
                            .font(.title)
                            .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .padding()
                    }
                    .frame(width: 140, height: 140)
                    VStack {
                        Text("Your score today is 208")
                            .foregroundColor(.white)
                            .font(.body)
                    }
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(.purple)
                .cornerRadius(16)
                .padding()
                
            }
            .navigationTitle("Checks")
        }
    }
}

struct ExpertoView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertoView()
    }
}
