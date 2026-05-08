//
//  TripListView.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 08/05/26.
//

import SwiftUI

struct TripListView: View {

    let category: String
    @ObservedObject var cartViewModel: CartViewModel
    @StateObject private var viewModel: TripListViewModel
    
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss

    init(category: String, cartViewModel: CartViewModel) {
        self.category = category
        self.cartViewModel = cartViewModel
        _viewModel = StateObject(wrappedValue: TripListViewModel(category: category))
    }

    var body: some View {
        List(viewModel.trips) { trip in
            HStack {
                VStack(alignment: .leading) {
                    Text(trip.destination)
                        .font(.headline)
                    Text("R$ \(trip.price, specifier: "%.2f")")
                        .font(.subheadline)
                }
                Spacer()
                Button("Adicionar") {
                    cartViewModel.addTrip(trip)
                    showAlert = true
                }
                .alert("Adicionado ao carrinho ✅",
                       isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("A viagem para \(trip.destination) foi adicionada.")
                }

            }
        }
        .navigationTitle(category)
        .toolbar {
            Button("Home") {
                dismiss()
            }
        }
    }
}

#Preview {
    TripListView(
            category: "Voos Nacionais",
            cartViewModel: CartViewModel()
        )
}
