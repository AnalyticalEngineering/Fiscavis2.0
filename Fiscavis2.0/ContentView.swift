//
//  ContentView.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    /// View Properties
    @State private var currentTab: String = "Expenses"
    var body: some View {
        TabView(selection: $currentTab) {
            ExpensesScreen(currentTab: $currentTab)
                .tag("Expenses")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }
            
            BudgetScreen()
                .tag("Budgets")
                .tabItem {
                    Image(systemName: "list.clipboard.fill")
                    Text("Budgets")
                }
        }
    }
}

#Preview {
    ContentView()
}
