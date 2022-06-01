//
//  Sendable.swift
//  composioner
//
//  Created by Misha Causur on 31.05.2022.
//

import SwiftUI

actor CurrentUserManager {
    func updateDatabase(userInfo: MyUserInfoClass) {
        
    }
}

struct MuUserInfoStruct: Sendable {
    var name: String
}

final class MyUserInfoClass: @unchecked Sendable {
    private var name: String
    let queue = DispatchQueue(label: "com.App.Info")
    init(name: String) {
        self.name = name
    }
    func updateName(name: String) {
        queue.async {
            self.name = name
        }
    }
}

struct SendableView: View {
    
    @StateObject private var viewModel = SendableViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Sendable_Previews: PreviewProvider {
    static var previews: some View {
        SendableView()
    }
}
