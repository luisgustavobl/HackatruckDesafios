//
//  ContentView.swift
//  Desafio 06
//
//  Created by Turma01-23 on 27/10/25.
//

import SwiftUI

struct Music: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}
var arrayMusic = [
    Music(id:1, name:"Xou da Xuxa", artist: "Xuxa", capa: "https://upload.wikimedia.org/wikipedia/pt/f/f8/Xou_da_Xuxa.JPG"), Music(id: 2, name: "Bohemian Rhapsody", artist: "Queen", capa: "https://cdn.ome.lt/hjRmEOTShQPWQAM1tj8SGoTOaSA=/fit-in/837x500/smart/filters:format(webp)/uploads/conteudo/fotos/queen-ii.jpg"), Music(id: 3, name: "Die With a Smile", artist: "Bruno mars, Lady Gaga", capa: "https://upload.wikimedia.org/wikipedia/pt/thumb/7/7d/Die_with_a_Smile_-_Lady_Gaga_%26_Bruno_Mars.jpg/500px-Die_with_a_Smile_-_Lady_Gaga_%26_Bruno_Mars.jpg"), Music(id: 4, name: "Hacking", artist: "Hackatruck", capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAWNtNcSWBpooHj2vf_XvDXGMI5HQemG3FDA&s"), Music(id: 5, name: "Test 5", artist: "test", capa: " "), Music(id: 6, name: "Test 6", artist: "test", capa: " "), Music(id: 7, name: "Test 7", artist: "test", capa: " "), Music(id: 8, name: "Test 8", artist: "test", capa: " "), Music(id: 9, name: "Test 9", artist: "test", capa: " "), Music(id: 10, name: "Testing", artist: "Swift", capa: "https://img.icons8.com/?size=512&id=_BTyk4vBumjx&format=png"),
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                let blueBG = LinearGradient(stops: [.init(color: .blue, location: 0.00), .init(color: .black, location: 0.6)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                blueBG
                ScrollView {
                    VStack {
                        Image("hackatruck-black")
                            .resizable()
                            .foregroundStyle(.tint)
                            .frame(width: 200, height: 200)
                            .padding()
                        HStack {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Hello, world!")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                Spacer()
                                HStack {
                                    Image("hackatruck-black")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text("Hello, world!")
                                        .bold()
                                    Spacer()
                                    
                                }
                            }
                        }
                            .foregroundStyle(.white)
                        ForEach(arrayMusic) { i in NavigationLink(destination: DetailView(musicvar: i)) {
                            HStack {
                                AsyncImage(url: URL(string: i.capa)) { image in
                                    image.resizable()
                                }   placeholder: {
                                    ProgressView()
                                        .tint(.gray)
                                }
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white)
                                VStack(alignment: .leading) {
                                    Text(i.name)
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                    
                                    Text(i.artist)
                                        .foregroundStyle(.white)
                                        .font(.system(size:15))
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.gray)
                            }
                        }
                        }
                        
                        HStack() {
                            Text("Sugeridos")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                            //                            .padding(.trailing,210)
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(arrayMusic) { item in NavigationLink(destination: DetailView(musicvar: item)) {
                                    VStack {
                                        AsyncImage(url: URL(string: item.capa)) { image in
                                            image.resizable()
                                        }   placeholder: {
                                            ProgressView()
                                                .tint(.gray)
                                        }
                                        .frame(width: 180, height: 180)
                                        .foregroundStyle(.white)
                                        VStack {
                                            Text(item.name)
                                                .foregroundStyle(.white)
                                                .bold()
                                            Text(item.artist)
                                                .foregroundStyle(.white)
                                                .font(.system(size:15))
                                        }
                                    }
                                }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
