//
//  ExpenseModel.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI
import SwiftData

@Model
class Expense {
    /// Expense Properties
    var title: String
    var subTitle: String
    var amount: Double
    var date: Date
    /// Expense Budget
    var budget: Budget?
    
    init(title: String, subTitle: String, amount: Double, date: Date, budget: Budget? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.budget = budget
    }
    
    /// Currency String
    @Transient
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: amount) ?? ""
    }
}
extension Expense {
    
    static var expenseSampleData: Expense {
        .init(title: "Deeswood Village", subTitle: "Monthly Rent", amount: 900, date: .now)
    }
}
