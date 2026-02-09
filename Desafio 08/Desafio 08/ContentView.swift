//
//  ContentView.swift
//  Desafio 08
//
//  Created by Turma01-23 on 29/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [.init(color: .red, location: 0.4), .init(color: .black, location: 1.0)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                ScrollView {
                    VStack { 
                        Image("image")
                            .resizable()
                            .foregroundStyle(.tint)
                            .scaledToFill()
                            .mask(LinearGradient(stops: [.init(color: .clear, location: 0.0), .init(color: .black, location: 0.4), .init(color: .black, location: 0.6), .init(color: .clear, location: 1.0)], startPoint: .topLeading, endPoint: .bottomLeading))
                            .mask(LinearGradient(stops: [.init(color: .clear, location: 0.0), .init(color: .black, location: 0.4), .init(color: .black, location: 0.6), .init(color: .clear, location: 1)], startPoint: .leading , endPoint: .trailing))
                            .ignoresSafeArea()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    VStack {
                        ForEach(viewModel.personagens) { i in NavigationLink(destination: DetailView(vari: i)) {
                            HStack {
                                AsyncImage(url: URL(string: i.image ?? "")) {vitor in
                                    vitor.resizable()
                                }   placeholder: {
                                    ProgressView()
                                        .tint(.gray)
                                }
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 125, height: 125)
                                .foregroundStyle(.white)
                                    Text(i.name ?? "")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                Spacer()
                            }
                        }
                        .padding()
                        }
                    }
                }
            }
            }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
