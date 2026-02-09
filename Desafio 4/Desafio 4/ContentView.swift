//
//  ContentView.swift
//  Desafio 4
//
//  Created by Turma01-23 on 23/10/25.
//

import SwiftUI
//extension Color

struct ContentView: View {
    @State private var number: Float = 0
    @State private var div: Float = 0
    @State var result: Float = 0
    @State var backColor: String = "default"
    @State var bgImage: String = ""
    @State var overlayImage: String = "questionblock"
    @State var test: Bool = false
    var body: some View {
        ZStack{
            Color(backColor)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Distância (km)")
                TextField("0", value: $number, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(20)
                    .frame(width: 250)
                Text("Tempo (h)")
                TextField("0", value: $div, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(20)
                    .frame(width: 250)
                Button("Calcular") {
                    self.result = number / div
                    if result < 10 {
                        self.backColor = "verdeClaro"
                    }   else if result >= 10 && result < 30 {
                        self.backColor = "azulClaro"
                    }   else if result >= 30 && result < 70 {
                        self.backColor = "amareloClaro"
                    }   else if result >= 70 && result < 90 {
                        self.backColor = "laranjaClaro"
                    }   else if result >= 90 && result < 130 {
                        self.backColor = "vermelhoClaro"
                        self.bgImage = "savanaLeao"
                        self.overlayImage = "leao"
                    }   else {
                        self.backColor = "bgErro"
                        self.overlayImage = "questionblock"
                    }
                }   .padding()
                    .foregroundColor(Color.white)
                    .background(Color.teal)
                    .clipShape(.rect(cornerRadius: 10))
                .padding()
                Text("\(result, specifier: "%.2f") Km/h")
                    Spacer()
                Image("savanaLeao")
                    .resizable()
                    .frame(width: 500,height: 450)
                    .opacity(0.9)
                    .mask(LinearGradient(stops: [.init(color: .clear, location: 0.02), .init(color: .black, location: 0.35), .init(color: .black, location: 0.8), .init(color: .clear, location: 0.98)], startPoint: .topLeading, endPoint: .bottomLeading))
                    .ignoresSafeArea()
                    .overlay(
                    Image(/*overlayImage*/"")
                         .resizable()
                         .frame(width: 300,height: 300)
                         .offset(x: 0, y: 0)
                         .imageScale(.small))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
