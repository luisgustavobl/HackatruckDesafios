//
//  Rosa.swift
//  Desafio 05
//
//  Created by Turma01-23 on 24/10/25.
//

import SwiftUI

struct Rosa: View {
    var body: some View {
        ZStack {
            Color(.pink)
                .ignoresSafeArea()
            Circle()
            Image(systemName: "paintbrush")
                .resizable()
                .foregroundStyle(Color(.pink))
                .scaledToFit()
                .frame(width: 275)
        }
    }
}

#Preview {
    Rosa()
}
