//
//  ExpenseRow.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import SwiftUI

struct ExpenseRow: View {
    var item: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type.rawValue)
            }
            Spacer()
            Text(item.amount, format: .currency(code: "USD"))
                .foregroundColor(colorFor(amount: item.amount))
        }
        .accessibilityElement() 
        .accessibilityLabel("\(item.name), \(item.amount, format: .currency(code: "USD"))")
        .accessibilityHint(item.type.rawValue)
    }
}

private extension ExpenseRow {
    func colorFor(amount: Double) -> Color {
        switch amount {
        case  0..<10:
            return .green
        case  10..<100:
            return .yellow
        default:
            return .red
        }
    }
}

