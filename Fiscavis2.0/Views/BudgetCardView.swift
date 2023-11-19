//
//  BudgetCardView.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

struct BudgetCardView: View {
    @Bindable var budget: Budget
    
    var displayTag: Bool = true
    @State private var budgetName: String = ""
    @State private var budgetAmount: CGFloat = 0
   
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(budget.budgetName)
                
                }
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
                    }
    }

#Preview {
    BudgetCardView(budget: Budget(budgetName: "Rent", budgetAmount: 900.00))
}
