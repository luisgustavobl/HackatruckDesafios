//
//  ContentView.swift
//  Desafio 01
//
//  Created by Turma01-23 on 22/10/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(AngularGradient(colors: [.yellow, .green, .red, .blue], center: .center, startAngle: .degrees(1), endAngle: .degrees(360)))
            .clipShape(Circle())
            .frame(width: 200, height: 200)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 100, height: 100, alignment: .leading)
                    .foregroundColor(.red)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100,alignment: .leading)
                    .foregroundColor(.blue)
            }
            Spacer()
            Circle()
                .modifier(Title())
            Spacer()
            HStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
