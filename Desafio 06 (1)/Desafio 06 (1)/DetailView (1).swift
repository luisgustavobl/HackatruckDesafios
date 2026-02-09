//
//  DetailView.swift
//  Desafio 06
//
//  Created by Turma01-23 on 27/10/25.
//

import SwiftUI

struct DetailView: View {
    let musicvar: Music
    
    let progressBar = Date()...Date().addingTimeInterval(30*2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                let blueBG = LinearGradient(stops: [.init(color: .blue, location: 0.00), .init(color: .black, location: 0.6)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                blueBG
                VStack {
                    Spacer()
                    AsyncImage(url: URL(string: musicvar.capa)) { image in
                        image.resizable()
                    }   placeholder: {
                        ProgressView()
                            .tint(.gray)
                    }
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.white)
                 /*   Image(musicvar.capa ?? "")
                        .resizable()
                        .foregroundStyle(.tint)
                        .frame(width: 200, height: 200)
                        .padding()  */
                    HStack {
                            VStack {
                                Text(musicvar.name)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                    .foregroundStyle(.white)
                                HStack {
                                    Text(musicvar.artist)
                                        .bold()
                                        .foregroundStyle(.white)
                                    
                                }
                            }
                        }
                    
                    Spacer()
                    VStack {
                        ProgressView(timerInterval: progressBar)
                            .foregroundStyle(.white)
                            .tint(.gray)
                            .padding()
                            .rotationEffect(.degrees(180))
                            
                        HStack {
                            Image(systemName: "shuffle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                                .padding()
                            Image(systemName: "backward.end.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                                .padding()
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.white)
                                .padding()
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                                .padding()
                            Image(systemName: "repeat")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

/*#Preview {
    DetailView()
}*/
