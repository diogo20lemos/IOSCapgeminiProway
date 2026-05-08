//
//  CartView.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import SwiftUI

struct CartView: View {

    @ObservedObject var cartViewModel: CartViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
                
        VStack {
            List {
                ForEach(cartViewModel.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.trip.destination)
                        Text("Qtd: \(item.quantity)")
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: cartViewModel.removeItem)
            }

            Text(
                "Total: R$ \(cartViewModel.totalValue(), specifier: "%.2f")"
            )
            .font(.title2)
            .padding()
        }
        .navigationTitle("Carrinho")
        .toolbar {
            Button("Home") {
                dismiss()
            }
        }

    }
}

#Preview {
    CartView(cartViewModel: CartViewModel())
}
