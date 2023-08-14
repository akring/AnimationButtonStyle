//
//  AnimationButtonStyle.swift
//  AnimationTest
//
//  Created by 吕俊 on 2023/7/8.
//

import SwiftUI

struct AnimationButtonStyle: ButtonStyle {
    @State var rotation: CGFloat = 0.0
    
    var full: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                Circle()
                    .frame(width: 200, height: 100)
                    .foregroundColor(Color(white: 0.15))
                    .shadow(color: .black.opacity(0.5), radius: 10)
                Circle()
                    .frame(width: full ? 260 : 60, height: 220)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                                                        startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(rotation))
                    .mask {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 196, height: 96)
                    }
            }
            .foregroundColor(.white)
            .font(.title)
            .onAppear {
                withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

#Preview {
    ContentView()
}

