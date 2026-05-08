//
//  Viagem.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 07/05/26.
//

import Foundation

/*
struct Trip: Identifiable, Equatable {
    var id: UUID = UUID()
    var country: String
    var region: String
    var city: String
}
 */

struct Trip: Identifiable {
    let id: Int
    let destination: String
    let price: Double
    let category: String
}




