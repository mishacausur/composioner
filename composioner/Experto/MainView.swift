//
//  MainView.swift
//  composioner
//
//  Created by Misha Causur on 07.05.2022.
//

import SwiftUI

struct MainView: View {
    var checks: [Model] = Model.data
    var body: some View {
        ScrollView {
            ForEach(checks, id: \.id) { check in
                    CardView(check: check)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
