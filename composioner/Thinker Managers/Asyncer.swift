//
//  Asyncer.swift
//  composioner
//
//  Created by Misha Causur on 02.05.2022.
//
import SwiftUI
import Combine

class AsyncerViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func addTitle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title1 : \(Thread.current)")
        }
    }
    
    func addTitle1() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title2 : \(Thread.current)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title1 : \(Thread.current)")
        }
    }
    
    func addAuthor() async {
        let author = "Autor: \(Thread.current)"
        self.dataArray.append(author)
    }
}

struct Asyncer: View {
@StateObject private var viewModel = AsyncerViewModel()
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            Task {
               await viewModel.addAuthor()
            }
//            viewModel.addTitle()
//            viewModel.addTitle1()
        }
    }
}

struct Asyncer_Previews: PreviewProvider {
    static var previews: some View {
        Asyncer()
    }
}
