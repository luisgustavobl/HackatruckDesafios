//
//  ContentView.swift
//  Desafio 10
//
//  Created by Turma01-23 on 03/11/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var text = "Você quer de flango com catupiri duvidoso, vento ou carne do mês passado?"

    @State var utterance = AVSpeechUtterance()
    let synthesizer = AVSpeechSynthesizer()
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("Type here", text: $text)
                .multilineTextAlignment(.center)
            
            Divider()
            
            Button {
                utterance = AVSpeechUtterance(string: text)
                utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                synthesizer.speak(utterance)
                utterance.rate = 2
                utterance.pitchMultiplier = 0.8
                utterance.postUtteranceDelay = 0.2
                utterance.volume = 0.8
            } label: {
                HStack{
                    Image(systemName: "microphone.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Synthesize")
                }
            }
        }
        
        VStack {
            Text("Go a pastel there?")
                .bold()
                .background(
                    Capsule()
                        .fill(.orange))
            Spacer()
            // .frame(width:)
            VStack {
                ForEach(viewModel.restaurante, id: \.self) { r in
                    Text(r.cardapio.joined(separator: ","))
                        .foregroundStyle(.black)
                        .font(.title2)
                HStack {
                    HStack {
                        AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/427/427430.png")) { image in
                            image.resizable()
                        }   placeholder: {
                            ProgressView()
                                .tint(.gray)
                        }
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.white)
                        VStack(alignment: .leading) {
                            Text("Cadu")
                                .foregroundStyle(.black)
                                .font(.title3)
                            
                            Text("Av. Silas Mugunba 513")
                                .foregroundStyle(.black)
                                .font(.system(size:15))
                        }
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius:15)
                            .foregroundStyle(.gray))
                }
            }
            Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
