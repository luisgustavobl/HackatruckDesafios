//
//  ViewModel.swift
//  Desafio 10
//
//  Created by Turma01-23 on 03/11/25.
//

import Foundation

struct Restp: Codable, Hashable {
    var id = UUID()
    let Restaurante: String
    let cardapio: [String]
}


class ViewModel: ObservableObject {
    @Published var restaurante: [Restp] = []
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/leituraUnifor") else {
            print("teste1"); return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in guard let data = data, error == nil else{
            print("teste2"); return
        }
            do {
                print("teste3")
                let parsed = try JSONDecoder().decode([Restp].self, from: data)
                DispatchQueue.main.async {
                    self?.restaurante = parsed
                }
            }
            
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
