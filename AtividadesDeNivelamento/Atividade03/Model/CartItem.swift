//
//  CartItem.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let trip: Trip
    var quantity: Int
}
