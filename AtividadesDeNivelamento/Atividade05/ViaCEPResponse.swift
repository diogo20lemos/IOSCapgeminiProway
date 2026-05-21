//
//  ViaCEPResponse.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import Foundation

struct ViaCEPResponse: Codable, Sendable {
    let cep: String?
    let logradouro: String?
    let bairro: String?
    let localidade: String?
    let uf: String?
}
