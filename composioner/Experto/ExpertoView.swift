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
                    VStack(alignment: .leading) {
                        Text("Create your room")
                            .foregroundColor(.white)
                            .font(.system(size: 18).bold())
                        Text("Use to chat and more")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(.top, 8)
                        Capsule(style: .circular)
                            .frame(maxWidth: .infinity)
                            .frame(height: 42)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }
                    .padding()
                    ZStack {
                        Circle()
                            .stroke(.white, lineWidth: 12)
                            
                            .rotationEffect(Angle(degrees: 270))
                            .opacity(0.4)
                        Circle()
                            .trim(from: 0, to: 0.74)
                            .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                            
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: 270))
                        Image(systemName: "checkmark")
                            .font(.title)
                            .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .padding()
                    }
                    .frame(width: 120, height: 120)
                    .padding(.trailing, 16)
                }
                .frame(height: 160)
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
