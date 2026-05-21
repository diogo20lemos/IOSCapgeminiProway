//
//  FormView.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import SwiftUI

struct FormView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel: ContactViewModel
    
    var contato: ContactCompleto?
    var index: Int?
    
    @State var nome: String = ""
    @State var email: String = ""
    @State var telefone: String = ""
    @State var nascimento = Date()
    @State var cep: String = ""
    @State var bairro: String = ""
    @State var logradouro: String = ""
    @State var numero: String = ""
    @State var estado: String = ""
    @State var cidade: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Dados")) {
                    TextField("Nome", text: $nome)
                    TextField("Email", text: $email)
                    TextField("Telefone", text: $telefone)
                    DatePicker("Nascimento", selection: $nascimento, displayedComponents: .date)
                }
                
                Section(header: Text("Endereço")) {
                    TextField("CEP", text: $cep)
                    
                    
                    Button("Buscar CEP") {
                        Task {
                            let response = await viewModel.buscarCEP(cep: cep)
                            
                            if let r = response {
                                logradouro = r.logradouro ?? ""
                                bairro = r.bairro ?? ""
                                cidade = r.localidade ?? ""
                                estado = r.uf ?? ""
                            }
                        }
                    }

                    
                    TextField("Logradouro", text: $logradouro)
                    TextField("Número", text: $numero)
                    TextField("Bairro", text: $bairro)
                    TextField("Cidade", text: $cidade)
                    TextField("Estado", text: $estado)
                }
                
                Button("Salvar") {
                    
                    let novo = ContactCompleto(
                        nome: nome,
                        email: email,
                        telefone: telefone,
                        nascimento: nascimento,
                        cep: cep,
                        bairro: bairro,
                        logradouro: logradouro,
                        numero: numero,
                        estado: estado,
                        cidade: cidade
                    )
                    
                    if let index = index {
                        viewModel.atualizar(index: index, contato: novo)
                    } else {
                        viewModel.adicionar(contato: novo)
                    }
                    
                    presentation.wrappedValue.dismiss()
                }
            }
            .navigationTitle(contato == nil ? "Novo Contato" : "Editar")
            .onAppear {
                if let c = contato {
                    nome = c.nome
                    email = c.email
                    telefone = c.telefone
                    nascimento = c.nascimento
                    cep = c.cep
                    bairro = c.bairro
                    logradouro = c.logradouro
                    numero = c.numero
                    estado = c.estado
                    cidade = c.cidade
                }
            }
        }
    }
}
