//
//  Model.swift
//  composioner
//
//  Created by Misha Causur on 07.05.2022.
//

import SwiftUI

enum Status {
    case progress
    case good
    case middle
    case bad
}

struct Model: Identifiable {
    let id = UUID()
    let status: Status
    
    var color: Color {
        switch status {
        case .progress:
            return .gray
        case .good:
            return .green
        case .middle:
            return .yellow
        case .bad:
            return .red
        }
    }
    
    static let data: [Model] = [
        .init(status: .good),
        .init(status: .progress),
        .init(status: .middle)]
}
