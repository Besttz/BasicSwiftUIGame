//
//  ContentView.swift
//  YangSpin
//
//  Created by ZhangTommy on 16/6/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var money = 1000
    @State private var num = [0,2,1]
    @State private var bg = [Color.white, Color.white, Color.white]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 110/255, green: 175/255, blue: 210/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 155/255, green: 205/255, blue: 220/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("YANG SPIN")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2).shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Money: \(money)")
                    .foregroundColor(Color.black)
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack{
                    Spacer()
                    CardView(symbol: $num[0],bg: $bg[0])
                    CardView(symbol: $num[1],bg: $bg[1])
                    CardView(symbol: $num[2],bg: $bg[2])
                    Spacer()
                }
                Spacer()
                HStack{
                    Button(action: {
                        // reduce money
                        self.money -= 20
                        // Change color to White
                        self.bg = self.bg.map {
                            _ in Color.white
                        }
                        // Generate Random Num
                        self.num = self.num.map(){ _ in
                            Int.random(in: 0...2)
                        }
                        // Check Winning
                        if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                            self.bg = self.bg.map {
                                _ in Color.green
                            }
                            self.money += 100
                        }
                        
                    }) {
                        Text("Spin")
                            .foregroundColor(.white)
                            .padding(15)
                            .padding(.horizontal, 30.0)
                            .background(Color(.orange).opacity(0.8))
                            .cornerRadius(20)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
