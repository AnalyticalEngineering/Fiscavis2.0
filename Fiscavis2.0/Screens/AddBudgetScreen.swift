//
//  AddBudgetScreen.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/18/23.
//

import SwiftUI
import SwiftData

struct AddBudgetScreen: View {
    @Query(animation: .snappy) private var allBudgets: [Budget]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var addBudgetScreen: Bool = false
    /// View Properties
    @State private var budgetName: String = ""
    @State private var budgetAmount: CGFloat = 0
    @State private var amountRemain: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            
            List {
                Section("Budget Category Name") {
                    TextField("Category Name", text: $budgetName)
                }
                Section("Budget Category Amount") {
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                            .foregroundStyle(.colorGrey)
                        
                        TextField("", value: $budgetAmount, formatter: formatter)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.colorGrey)
                    }
                }
                
            }
            
            .navigationTitle("Create Budget")
            .navigationBarTitleDisplayMode(.inline)
            /// Add & Cancel Button
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        addBudgetScreen = false
                        dismiss()
                    }
                    .fontDesign(.serif)
                    .font(.title2)
                    .fontWeight(.bold)
                    .tint(.red)
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save", action: AddBudget)
                        .fontDesign(.serif)
                        .font(.title2)
                        .fontWeight(.bold)
                        .tint(.colorGreen)
                        .disabled(isAddButtonDisabled)
                    }
                    
                }
                
            }
        .presentationDetents([.height(250)])
        .presentationCornerRadius(20)
        .interactiveDismissDisabled()
        }
    /// Adding Expense to the Swift Data
    func AddBudget() {
        let budget = Budget(budgetName: budgetName, budgetAmount: budgetAmount)
        context.insert(budget)
        /// Closing View, Once the Data has been Added Successfully!
        dismiss()
    }
    
    /// Decimal Formatter
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Disabling Add Button, until all data has been entered
    var isAddButtonDisabled: Bool {
        return budgetName.isEmpty ||  budgetAmount == .zero
    }
}

#Preview {
    AddBudgetScreen()
}
