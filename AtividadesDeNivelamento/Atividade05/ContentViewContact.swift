//
//  ContentViewContact.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import SwiftUI

struct ContentViewContact: View {
    
    @StateObject var viewModel = ContactViewModel()
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.contatos.indices, id: \.self) { index in
                    let contato = viewModel.contatos[index]
                    
                    NavigationLink(destination: FormView(viewModel: viewModel, contato: contato, index: index)) {
                        VStack(alignment: .leading) {
                            Text(contato.nome).bold()
                            Text(contato.email)
                        }
                    }
                }
                .onDelete(perform: viewModel.remover)
            }
            .navigationTitle("Contatos")
            .toolbar {
                Button("+") {
                    showingAddScreen = true
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                FormView(viewModel: viewModel)
            }
        }
    }
}
