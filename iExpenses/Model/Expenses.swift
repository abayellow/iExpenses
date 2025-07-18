//
//  Expenses.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import Observation
import Foundation

@Observable
class Expenses: ObservableObject {
     var items = [ExpenseItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items"),
           let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
            items = decoded
        } else {
            items = []
        }
    }
    
    func items(for type: ExpenseType) -> [ExpenseItem] {
        items.filter { $0.type == type }
    }
}
