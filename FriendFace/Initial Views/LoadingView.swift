//
//  LoadingView.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/23/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @Binding var degrees:Double
    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: "dot.radiowaves.left.and.right")
                .resizable()
                .frame(width: 100, height:100)
                .scaledToFit()
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                .onAppear() {
                    let baseAnimation = Animation.linear(duration: 1.0)
                    let repeated = baseAnimation.repeatForever(autoreverses: false)
                    return withAnimation(repeated) {
                        self.degrees = 0
                    }
            }
            Text("Loading data")
                .font(.title)
                .padding(8)
                .foregroundColor(.white)
                .background(Color.blue.opacity(0.75))
                .clipShape(Capsule())
        }.padding(.top)
    }
}
