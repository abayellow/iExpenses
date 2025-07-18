//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}


enum ExpenseType: String, CaseIterable, Identifiable, Codable {
    case business = "Business"
    case personal = "Personal"
    
    var id: String { rawValue }
}



//enum ExpenseType: String, Codable {
//    case personal = "Personal"
//    case business = "Business"
//}
