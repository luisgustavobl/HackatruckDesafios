//
//  ContentView.swift
//  Desafio 05
//
//  Created by Turma01-23 on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Rosa()
                .tabItem {
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
            Azul()
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed.fill")
                }
            Cinza()
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            Lista()
                .tabItem {
                    Label("Lista", systemImage: "bullet.list")
                }
        }
        .toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
    }
}

#Preview {
    ContentView()
}
