//
//  AddView.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type: ExpenseType = .business
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    private let types: [ExpenseType] = [.business, .personal]
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
            
            TextField("Amount", value: $amount, format: .currency(code: "USD"))
        }
        .navigationTitle("Add expense")
        .toolbar {
            Button("Done") {
                let expenseItem = ExpenseItem(name: name, type: type, amount: amount)
                expenses.items.append(expenseItem)
                dismiss()
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
