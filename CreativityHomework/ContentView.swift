//
//  ContentView.swift
//  CreativityHomework
//
//  Created by Антон Пеньков on 18.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PaintingView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Visitors")
                }
            
            StrokeView()
                .tabItem {
                    Image(systemName: "hand.draw")
                    Text("Strokes")
                }
        }
    }
}

#Preview {
    ContentView()
}
