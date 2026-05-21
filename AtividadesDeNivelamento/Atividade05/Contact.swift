//
//  Contact.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import Foundation

struct ContactCompleto: Identifiable {
    let id = UUID()
    
    var nome: String
    var email: String
    var telefone: String
    var nascimento: Date
    var cep: String
    var bairro: String
    var logradouro: String
    var numero: String
    var estado: String
    var cidade: String
}
