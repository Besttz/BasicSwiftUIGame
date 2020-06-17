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
    @State private var num = [0,2,1,0,2,1,0,2,1]
    @State private var bg = [Color.white, Color.white, Color.white,Color.white, Color.white, Color.white,Color.white, Color.white, Color.white]
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
                VStack {
                    HStack{
                        Spacer()
                        CardView(symbol: $num[0],bg: $bg[0])
                        CardView(symbol: $num[1],bg: $bg[1])
                        CardView(symbol: $num[2],bg: $bg[2])
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $num[3],bg: $bg[3])
                        CardView(symbol: $num[4],bg: $bg[4])
                        CardView(symbol: $num[5],bg: $bg[5])
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $num[6],bg: $bg[6])
                        CardView(symbol: $num[7],bg: $bg[7])
                        CardView(symbol: $num[8],bg: $bg[8])
                        Spacer()
                    }
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
//                        self.num = self.num.map(){ _ in
//                            Int.random(in: 0...2)
//                        }
                        for i in 0...2 {
                            self.num[i]=Int.random(in: 0...2)
                        }
                        // Check Winning
                        if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                            for i in 0...2 {
                                self.bg[i]=Color.green
                            }
                            self.money += 100
                        }  else {
                            for i in 0...2 {
                                self.bg[i]=Color.red
                            }
                        }
                        
                    }) {
                        Text("Spin")
                            .foregroundColor(.white)
                            .padding(15)
                            .padding(.horizontal, 30.0)
                            .background(Color(.orange).opacity(0.8))
                            .cornerRadius(20)
                    }
                    
                    Button(action: {
                        // reduce money
                        self.money -= 100
                        // Change color to White
                        self.bg = self.bg.map {
                            _ in Color.white
                        }
                        // Generate Random Num
                        self.num = self.num.map(){ _ in
                            Int.random(in: 0...2)
                        }
                        // Check Winning
                        
                        // Horizon
                        if self.num[0] == self.num[1] && self.num[1] == self.num[2] {
                            for i in 0...2 {
                                self.bg[i]=Color.green
                            }
                            self.money += 100
                        }
                        if self.num[3] == self.num[4] && self.num[4] == self.num[5] {
                            for i in 3...5 {
                                self.bg[i]=Color.green
                            }
                            self.money += 100
                        }
                        if self.num[6] == self.num[7] && self.num[7] == self.num[8] {
                            for i in 6...8 {
                                self.bg[i]=Color.green
                            }
                            self.money += 100
                        }
                        // Vertical
                        if self.num[0] == self.num[3] && self.num[3] == self.num[6] {
                            self.bg[0]=Color.green
                            self.bg[3]=Color.green
                            self.bg[6]=Color.green
                            self.money += 100
                        }
                        if self.num[1] == self.num[4] && self.num[4] == self.num[7] {
                            self.bg[1]=Color.green
                            self.bg[4]=Color.green
                            self.bg[7]=Color.green
                            self.money += 100
                        }
                        if self.num[2] == self.num[5] && self.num[5] == self.num[8] {
                            self.bg[2]=Color.green
                            self.bg[5]=Color.green
                            self.bg[8]=Color.green
                            self.money += 100
                        }
                        // X
                        if self.num[0] == self.num[4] && self.num[4] == self.num[8] {
                            self.bg[0]=Color.green
                            self.bg[4]=Color.green
                            self.bg[8]=Color.green
                            self.money += 100
                        }
                        if self.num[2] == self.num[4] && self.num[4] == self.num[6] {
                            self.bg[2]=Color.green
                            self.bg[4]=Color.green
                            self.bg[6]=Color.green
                            self.money += 100
                        }
                    }) {
                        Text("Special Spin")
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
