//
//  CartViewModel.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import Foundation
internal import Combine
import SwiftUI

class CartViewModel: ObservableObject {

    @Published var items: [CartItem] = []

    func addTrip(_ trip: Trip) {
        if let index = items.firstIndex(where: { $0.trip.id == trip.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(trip: trip, quantity: 1))
        }
    }

    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func totalValue() -> Double {
        items.reduce(0) { result, item in
            result + item.trip.price * Double(item.quantity)
        }
    }
}
