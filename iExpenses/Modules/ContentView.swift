//
//  ContentView.swift
//  iExpenses
//
//  Created by Alexander Abanshin on 18.07.25.
//

import SwiftUI

enum Route: Hashable {
    case add
}


struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack(path: $path) {  
            List {
                ExpenseSection(
                    title: "Personal",
                    items: expenses.items(for: .personal),
                    onDelete: { removeItems(at: $0, from: .personal) }
                )
                
                ExpenseSection(
                    title: "Business",
                    items: expenses.items(for: .business),
                    onDelete: { removeItems(at: $0, from: .business) }
                )
            }
            .listStyle(.insetGrouped)
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                    path.append(Route.add)
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .add:
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    private func removeItems(at offsets: IndexSet, from type: ExpenseType) {
        let itemsForType = expenses.items(for: type)
        let idsToRemove = offsets.map { itemsForType[$0].id }
        expenses.items.removeAll { idsToRemove.contains($0.id) }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

