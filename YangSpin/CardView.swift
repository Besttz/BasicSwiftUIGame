//
//  CardView.swift
//  YangSpin
//
//  Created by ZhangTommy on 16/6/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol:Int
    @Binding var bg:Color
    var body: some View {
        Image("p\(symbol)")
        .resizable()
        .aspectRatio( 1,contentMode: .fit)
        .cornerRadius(20)
        .padding(20)
        .background(bg.opacity(0.5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant(0),bg: Binding.constant(Color.green))
    }
}
