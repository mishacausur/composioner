//
//  Lottier.swift
//  composioner
//
//  Created by Misha Causur on 19.05.2022.
//

import SwiftUI
import Lottie

struct Lottier<Content: View>: View {
    var content: Content
    var showIndicators: Bool
    var lottieName: String
    var onRefresh: () async -> Void
    init(showIndicators: Bool,
         lottieName: String,
         @ViewBuilder content: @escaping () -> Content,
         onRefresh: @escaping () async -> Void) {
        self.showIndicators = showIndicators
        self.lottieName = lottieName
        self.content = content()
        self.onRefresh = onRefresh
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: showIndicators) {
            content
        }
    }
}

struct Lottier_Previews: PreviewProvider {
    static var previews: some View {
        Lottier(showIndicators: false, lottieName: "104753-friendly-owl") {
            Rectangle()
                .fill(.red)
                .frame(height: 200)
        } onRefresh: {
            
        }

    }
}

extension View {
    @ViewBuilder
    func offset() {
        
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
