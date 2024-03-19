//
//  PaintingView.swift
//  CreativityHomework
//
//  Created by Антон Пеньков on 18.03.2024.
//

import SwiftUI

struct PaintingView: View {
    @State private var figure = Figure.one
    @State private var isTapped = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 60
            let height = width * 7 / 5
            
            ZStack {
                VStack {
                    Color(red: 0.1, green: 0.2, blue: 0.4)
                    Color(red: 0.5, green: 0.30, blue: 0, opacity: 0.5)
                        .frame(height: 110)
                }
                .ignoresSafeArea()
                
                Rectangle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.orange.opacity(0.7), .brown]),
                            center: .center,
                            startRadius: width * 0.2,
                            endRadius: width * 1.2
                        )
                    )
                    .frame(width: width + 50, height: height + 50)
                    .shadow(color: .black, radius: 20)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image("Bouguereau")
                            .resizable()
                            .frame(width: width, height: height)
                            .shadow(color: .white, radius: 10)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: figure.rawValue)
                            .resizable()
                            .frame(width: getWidth(for: figure), height: 320)
                            .foregroundStyle(.white)
                            .blur(radius: 5.0)
                            .shadow(radius: 30)
//                            .transition(.customTransition)
                            .offset(x: isTapped ? 500 : 0)
                            .animation(.bouncy, value: isTapped)
                    }
                }
                
                VStack {
                    Text("Tap to change visitor")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .padding(.top, 20)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation {
                    tapAction()
                }
            }
        }
        .background(.brown.opacity(0.6))
    }
    
    private func tapAction() {
        isTapped.toggle()
        
        switch figure {
        case .one:
            figure = .couple
        case .couple:
            figure = .family
        case .family:
            figure = .wave
        case .wave:
            figure = .parent
        case .parent:
            figure = .one
        }
        
        isTapped.toggle()
    }
    
    private func getWidth(for figure: Figure) -> Double {
        switch figure {
        case .one:
            140
        case .couple:
            340
        case .family:
            380
        case .wave:
            160
        case .parent:
            280
        }
    }
}

enum Figure: String {
    case one = "figure.stand"
    case couple = "figure.2.arms.open"
    case family = "figure.2.and.child.holdinghands"
    case wave = "figure.wave"
    case parent = "figure.and.child.holdinghands"
    
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
        let removal = AnyTransition.move(edge: .trailing)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

#Preview {
    PaintingView()
}
