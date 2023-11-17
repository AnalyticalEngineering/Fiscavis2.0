//
//  GroupedExpenses.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI
import SwiftData

struct GroupedExpenses: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
    
    /// Group Title
    var groupTitle: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
}


//#Preview {
//    GroupedExpenses(date: <#Date#>, expenses: <#[Expense]#>)
//}
