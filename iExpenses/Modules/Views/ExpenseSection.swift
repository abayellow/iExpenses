//
//  ExpenseSection.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let items: [ExpenseItem]
    let onDelete: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(items) { item in
                ExpenseRow(item: item)
            }
            .onDelete(perform: onDelete)
        }
    }
}
