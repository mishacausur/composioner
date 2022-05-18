//
//  ContinuationView.swift
//  composioner
//
//  Created by Misha Causur on 16.05.2022.
//

import SwiftUI

struct ContinuationView: View {
    @StateObject private var viewModel = ContinuationViewModel()
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.getImages()
        }
    }
}

struct ContinuationView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationView()
    }
}
