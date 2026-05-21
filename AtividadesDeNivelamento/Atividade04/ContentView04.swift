//
//  ContentView04.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 15/05/26.
//

import SwiftUI

struct ContentView04: View {
    @StateObject var viewModel = ExpenseViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.expenses, id: \.id) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.category ?? "")
                            .font(.headline)

                        Text("R$ \(expense.amount, specifier: "%.2f")")
                        Text(expense.month ?? "")
                            .font(.subheadline)
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { viewModel.expenses[$0] }.forEach(viewModel.deleteExpense)
                }
            }
            .navigationTitle("Despesas")
            .toolbar {
                NavigationLink(destination: AddExpenseView(viewModel: viewModel)) {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                viewModel.fetchExpenses()
            }
        }
    }
}
