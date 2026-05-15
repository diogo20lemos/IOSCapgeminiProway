//
//  ViewModel.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 15/05/26.
//

import CoreData
import SwiftUI
internal import Combine

class ExpenseViewModel: ObservableObject {
    let context = PersistenceController.shared.container.viewContext

    @Published var expenses: [Expense] = []

    func fetchExpenses() {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()

        do {
            expenses = try context.fetch(request)
        } catch {
            print("Erro ao buscar: \(error)")
        }
    }

    func addExpense(category: String, amount: Double, month: String) {
        let newExpense = Expense(context: context)
        newExpense.id = UUID()
        newExpense.category = category
        newExpense.amount = amount
        newExpense.month = month
        newExpense.date = Date()

        save()
    }

    func deleteExpense(_ expense: Expense) {
        context.delete(expense)
        save()
    }

    func save() {
        do {
            try context.save()
            fetchExpenses()
        } catch {
            print("Erro ao salvar: \(error)")
        }
    }
}
