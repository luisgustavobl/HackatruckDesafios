//
//  ViewModel.swift
//  Desafio 08
//
//  Created by Turma01-23 on 29/10/25.
//

import Foundation

struct Harryp: Codable,Identifiable {
    let id: String?
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actors: [String]?
    let alive: Bool?
    let image: String? //"https://img.icons8.com/?size=512&id=_BTyk4vBumjx&format=png"
}

struct Wand: Codable {
    let wood: String?
    let core: String?
    let length: Double?
}

class ViewModel: ObservableObject {
    @Published var personagens: [Harryp] = []
    func fetch() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            print("teste1"); return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in guard let data = data, error == nil else{
            print("teste2"); return
        }
            do {
                print("teste3")
                let parsed = try JSONDecoder().decode([Harryp].self, from: data)
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            }
            
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
