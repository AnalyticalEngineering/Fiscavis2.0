//
//  BudgetModel.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI
import SwiftData

@Model
class Budget {
    var budgetName: String
    var budgetAmount: Double
    
    /// Category Expenses
    @Relationship(deleteRule: .cascade, inverse: \Expense.budget)
    var expenses: [Expense]?
    
    init(budgetName: String, budgetAmount: Double, expenses: [Expense]? = nil) {
        self.budgetName = budgetName
        self.budgetAmount = budgetAmount
        self.expenses = expenses
    }
    /// Currency String
    @Transient
    var budgetCurrencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: budgetAmount) ?? ""
    }
    var currencyRemaining: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: budgetAmount) ?? ""
    }
}

//extension Budget {
//    
//    static var sampleData: Expense {
//        .init(title: "DeesWood Village", subTitle: "Rent", amount: 900.00, date: .now)
//    }
//}
