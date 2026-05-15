//
//  AddExpenseView.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 15/05/26.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpenseViewModel

    @State private var selectedCategory = ExpenseCategory.energia
    @State private var selectedMonth = Month.janeiro
    @State private var amount = ""

    var body: some View {
        Form {
            Picker("Categoria", selection: $selectedCategory) {
                ForEach(ExpenseCategory.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }

            TextField("Valor", text: $amount)
                .keyboardType(.decimalPad)

            Picker("Mês", selection: $selectedMonth) {
                ForEach(Month.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }

            Button("Salvar") {
                if let value = Double(amount) {
                    viewModel.addExpense(
                        category: selectedCategory.rawValue,
                        amount: value,
                        month: selectedMonth.rawValue
                    )
                }
            }
        }
        .navigationTitle("Nova Despesa")
    }
}
