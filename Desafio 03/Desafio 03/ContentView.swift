//
//  ContentView.swift
//  Desafio 03
//
//  Created by Turma01-23 on 22/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var baoba: String = ""
    @State private var alertaG: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Batalha," + baoba)
                TextField("Qual seu nome",text: $baoba)
                    .multilineTextAlignment(    .center)
                    .padding()
            }
            Image("stadium-gmax")
                .resizable()
                .frame(width: 1300,height: 650)
                .opacity(0.5)
                .mask(LinearGradient(stops: [.init(color: .clear, location: 0.03), .init(color: .black, location: 0.35), .init(color: .black, location: 0.9), .init(color: .clear, location: 0.98)], startPoint: .topLeading, endPoint: .bottomLeading))
                .overlay(            Image("gblastoise")
                    .resizable()
                    .frame(width: 1000,height: 880)
                    .offset(x: -200, y: 30)
                    .imageScale(.small))
            HStack {
                Button("Alerta") {
                    alertaG = true
                }.alert("Prosseguir para a luta?", isPresented: $alertaG, actions: {Text("Sim"); Text("Não")}, message: {Text("Este oponente é forte..")})
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
