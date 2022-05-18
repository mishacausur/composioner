//
//  Lottier.swift
//  composioner
//
//  Created by Misha Causur on 19.05.2022.
//

import SwiftUI
import Lottie

struct Lottier: View {
    @State var isPlaying: Bool = false
    var body: some View {
        LottierView(filename: "104753-friendly-owl", isPlaying: $isPlaying)
            .frame(width: 200)
            .onTapGesture {
                isPlaying.toggle()
            }
    }
}

struct Lottier_Previews: PreviewProvider {
    static var previews: some View {
        Lottier()
    }
}

struct LottierView: UIViewRepresentable {
    var filename: String
    @Binding var isPlaying: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(view: view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.subviews.forEach { view in
            if view.tag == 1009, let lottie = view as? AnimationView {
                if isPlaying {
                    lottie.play()
                } else {
                    lottie.pause()
                }
             
            }
        }
    }
    
    private func addLottieView(view to: UIView) {
        let lottieView = AnimationView(name: filename, bundle: .main)
        lottieView.backgroundColor = .clear
        lottieView.tag = 1009
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        to.addSubview(lottieView)
        [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)].forEach { $0.isActive = true }
    }
}
