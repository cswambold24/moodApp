//
//  FlowerView.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/26/24.
//

import SwiftUI

struct FlowerView: View {
    @State private var rPetal = false
    @State private var lPetal = false
    @State private var mrPetal = false
    @State private var mlPetal = false
    @State private var customShadow = false
    @Binding var animateFlower: Bool
    let width: CGFloat = 90
    let height: CGFloat = 180
    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
                    .rotationEffect(.degrees(0), anchor: .bottom)
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
                    .rotationEffect(.degrees(mlPetal ? -25 : -5), anchor: .bottom)
                    .animation (Animation.easeInOut(duration: 2).delay (2).repeatForever (autoreverses: true))
                    .onAppear {
                        mlPetal.toggle()
                    }
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame (width: width, height: height, alignment: .center)
                    .rotationEffect(.degrees(mlPetal ? 25 : 5), anchor: .bottom)
                    .animation (Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        mrPetal.toggle()
                    }
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center)
                    .rotationEffect(.degrees(lPetal ? -50: -10), anchor: .bottom)
                    .animation (Animation.easeInOut(duration: 2).delay (2).repeatForever(autoreverses: true))
                    .onAppear {
                        lPetal.toggle()
                    }
                Image (systemName: "diamond.fill")
                    .resizable()
                    .frame(width: width, height: height, alignment: .center) //Right
                    .rotationEffect(.degrees(rPetal ? 50 : 10), anchor: .bottom)
                    .animation (Animation.easeInOut(duration: 2).delay (2).repeatForever(autoreverses: true))
                    .onAppear {
                        rPetal.toggle()
                    }
            }.shadow(color: Color.purple, radius: customShadow ? 20 : 0)
                .hueRotation (Angle(degrees: customShadow ? 0 : 165))
                .animation (Animation.easeInOut(duration: 2).delay (2).repeatForever (autoreverses: true))
                .onAppear {
                    customShadow.toggle()
                }
                .frame(width: 300, height: 300, alignment: .center)
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true)) {
                animateFlower.toggle()
            }
        }
    }
}


