//
//  Model.swift
//  composioner
//
//  Created by Misha Causur on 07.05.2022.
//

import Foundation

enum Status {
    case progress
    case good
    case middle
    case bad
}

struct Model: Identifiable {
    let id = UUID()
    let status: Status
    
    static let data: [Model] = [
        .init(status: .good),
        .init(status: .progress),
        .init(status: .middle)]
}
