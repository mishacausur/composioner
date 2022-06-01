//
//  ViewModel.swift
//  composioner
//
//  Created by Misha Causur on 01.06.2022.
//

import Foundation

final class SendableViewModel: ObservableObject {
    let manager = CurrentUserManager()
    
    func updateCurrentUserInfo() async {
        let info = MyUserInfoClass(name: "Name")
        await manager.updateDatabase(userInfo: info)
    }
}
