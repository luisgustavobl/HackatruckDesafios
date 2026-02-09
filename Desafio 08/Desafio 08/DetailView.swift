//
//  DetailView.swift
//  Desafio 08
//
//  Created by Turma01-23 on 29/10/25.
//

import SwiftUI

struct DetailView: View {
    let vari : Harryp
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack {
            LinearGradient(stops: [.init(color: .red, location: 0.4), .init(color: .black, location: 1.0)], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            ScrollView {
                Text("Nome: " + (vari.name ?? ""))
                    .foregroundStyle(.white)
                VStack {
                    ForEach(viewModel.personagens) { p in
                        HStack {
                            Text("Tamanho da vara: " + String(p.wand.length ?? 0) + "cm")
                                .foregroundStyle(.white)
                                .font(.title2)
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

/*#Preview {
    DetailView()
}
*/
