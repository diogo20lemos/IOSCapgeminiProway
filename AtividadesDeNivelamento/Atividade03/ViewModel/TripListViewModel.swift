//
//  TripListViewModel.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import Foundation
internal import Combine

class TripListViewModel: ObservableObject {

    @Published var trips: [Trip] = []

    init(category: String) {
        let allTrips = [
            Trip(id: 1, destination: "São Paulo", price: 600, category: "Voos Nacionais"),
            Trip(id: 2, destination: "Rio de Janeiro", price: 550, category: "Voos Nacionais"),
            Trip(id: 3, destination: "Nova York", price: 3500, category: "Voos Internacionais"),
            Trip(id: 4, destination: "Paris", price: 4200, category: "Voos Internacionais"),
            Trip(id: 5, destination: "Resort na Bahia", price: 2800, category: "Pacotes Turísticos")
        ]

        trips = allTrips.filter { $0.category == category }
    }
}
