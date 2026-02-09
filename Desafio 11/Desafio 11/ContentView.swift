//
//  ContentView.swift
//  Desafio 11
//
//  Created by Turma01-23 on 04/11/25.
//

import SwiftUI
import GoogleGenerativeAI
import AVFoundation


struct ContentView: View {
    let model = GenerativeModel(name: "gemini-2.5-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "Olá, como posso te ajudar hoje?"
    @State var textInputSave = ""
    
    func sendMessage() {
        aiResponse = ""
        
        Task {
            do {
                let response = try await model.generateContent(textInput)
                
                guard let text = response.text else {
                    textInput = "Desculpe, não consigo processar isso agora \nPor favor tente de novo."
                    return
                }
                
                textInput = ""
                aiResponse = text
                
            }catch {
                aiResponse = "Algo deu errado!\n\(error.localizedDescription)"
            }
        }
    }
    
    @State var utterance = AVSpeechUtterance()
    let synthesizer = AVSpeechSynthesizer()
    
    @State private var Fade = true
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                TextField("Type here", text: $textInput)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .disableAutocorrection(true)
                Button("Enviar mensagem"){
                    sendMessage()
                    textInputSave = textInput
                }
                Divider()
                Spacer()
                
                ScrollView{
                    Text(textInputSave)
                        .foregroundStyle(.gray)
                        .font(.title2)
                        .padding()
                 //       .frame(width: 500, height: .infinity)
                  //      .background(.gray)
                        
                    if aiResponse == "" {
                        do {placeholder: do {
                            ProgressView()
                                .scaleEffect(2)
                                .frame(width: 75,height: 75)
                                .background(Color(UIColor.lightGray).opacity(0.6))
                                .tint(.white)
                                .clipShape(.rect(cornerRadius: 17))
                      //          .transition(.opacity.combined(with: .scale))
                      //          .animation(.easeInOut(duration: 0.5),value: aiResponse)
                        }
                        }
                    }else {
                        
                        Text(aiResponse)
                            .padding()
                            .transition(.slide)
                            .animation(.easeInOut(duration: 0.5), value: aiResponse)
                            .frame(width: 360,height: .infinity)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(9)
                    }
                }
                Divider()
                Button {
                    utterance = AVSpeechUtterance(string: aiResponse)
                    utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                    synthesizer.speak(utterance)
                    utterance.rate = 0.5
                    utterance.pitchMultiplier = 0.8
                    utterance.postUtteranceDelay = 0.1
                    utterance.volume = 0.8
                } label: {
                    HStack{
                        Image(systemName: "microphone.fill")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Ler resposta em voz alta")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
