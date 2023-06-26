//
//  ContentView.swift
//  AnimationOnSwiftUI
//
//  Created by Александр Полочанин on 26.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showRate = false
    @State private var heartBeat = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            Image("heart")
                .resizable()
                .frame(width: 150, height: 150)
                .scaleEffect(heartBeat ? 1 : 1.3)
                .animation(.interpolatingSpring(stiffness: 30, damping: 10)
                    .speed(1.3/2)
                    .repeatForever(autoreverses: false),
                           value: heartBeat
                )
                .onAppear() {
                    heartBeat.toggle()
                }
            Image("heart-beat")
                .resizable()
                .frame(width: 130, height: 100)
                .clipShape(Rectangle().offset(x: showRate ? 0 : -130))
                .animation(.interpolatingSpring(stiffness: 30, damping: 10)
                    .speed(1.3)
                    .repeatForever(autoreverses: true)
                    .delay(0.2),
                           value: showRate
                )
                .offset(x:-5, y: 10)
                .onAppear() {
                    showRate.toggle()
                }
        }
        .shadow(color: .red, radius: 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
