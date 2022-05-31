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

final class MyUserInfoClass: @unchecked Sendable {
    var name: String
    init(name: String) {
        self.name = name
    }
}

final class SendableViewModel: ObservableObject {
    let manager = CurrentUserManager()
    
    func updateCurrentUserInfo() async {
        let info = MyUserInfoClass(name: "Name")
        await manager.updateDatabase(userInfo: info)
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
