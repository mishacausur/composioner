//
//  CardView.swift
//  composioner
//
//  Created by Misha Causur on 07.05.2022.
//

import SwiftUI

struct CardView: View {
    var check: Model = Model.data[0]
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.system(size: 28).bold())
                    .padding(.trailing, 12)
                    .padding(.top, 4)
                VStack {
                    Text("Рисков не обнаружено")
                        .foregroundColor(.white)
                        .font(.system(size: 18).bold())
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Дата проверки")
                            .font(.system(size: 14))
                        Text("22 сентября")
                            .font(.system(size: 14).bold())
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.bottom, 8)
           
            
            
       
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(check.color)
        .cornerRadius(16)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
