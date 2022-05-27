//
//  GlobalManager.swift
//  composioner
//
//  Created by Misha Causur on 27.05.2022.
//

import SwiftUI

@globalActor struct FirstGlobalActor {
    
   static var shared = GlobalManager()
    
}

actor GlobalManager {
    func getDataFromDB() -> [String] {
        return ["misha","pussifer","jenny", "so on"]
    }
}
