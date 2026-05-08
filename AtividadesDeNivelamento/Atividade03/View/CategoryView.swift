//
//  CategoryView.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import SwiftUI

struct CategoryView: View {

    let categories = [
        "Voos Nacionais",
        "Voos Internacionais",
        "Pacotes Turísticos"
    ]

    @StateObject var cartViewModel = CartViewModel()

    var body: some View {
        NavigationStack {
            List(categories, id: \.self) { category in
                NavigationLink(category) {
                    TripListView(
                        category: category,
                        cartViewModel: cartViewModel
                    )
                }
            }
            .navigationTitle("Categorias")
            .toolbar {
                NavigationLink("Carrinho") {
                    CartView(cartViewModel: cartViewModel)
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
