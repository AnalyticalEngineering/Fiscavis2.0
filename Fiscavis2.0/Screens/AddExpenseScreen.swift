//
//  AddExpenseScreen.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI
import SwiftData

struct AddExpenseScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    /// View Properties
    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var budget: Budget?
    /// Categories
    @Query(animation: .snappy) private var allBudgets: [Budget]
    var body: some View {
        NavigationStack {
            List {
                Section("Budget") {
                    HStack {
                        Text("Budget Category")
                        
                        Spacer()
                        
                        Menu {
                            ForEach(allBudgets) { budget in
                                Button(budget.budgetName) {
                                    self.budget = budget
                                }
                            }
                            
                            /// None Button
                            Button("None") {
                                budget = nil
                            }
                        } label: {
                            if let budgetName = budget?.budgetName {
                                Text(budgetName)
                            } else {
                                Text("None")
                            }
                        }
                    }
                }
                
                Section("Receipt Name ") {
                    TextField("Name of company or person paid.", text: $title)
                }
                
                Section("Description") {
                    TextField("What was purchased?", text: $subTitle)
                }
                
                Section("Amount") {
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                            .foregroundStyle(.colorGrey)
                        
                        TextField("", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.colorGrey)
                    }
                }
                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                /// Cancel & Add Button
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .fontDesign(.serif)
                    .font(.title2)
                    .fontWeight(.bold)
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save", action: addExpense)
                        .fontDesign(.serif)
                        .font(.title2)
                        .fontWeight(.bold)
                        .tint(.colorGreen)
                        .disabled(isAddButtonDisabled)
                }
            }
            .navigationTitle("Enter Expense")
                    .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    /// Disabling Add Button, until all data has been entered
    var isAddButtonDisabled: Bool {
        return title.isEmpty || subTitle.isEmpty || amount == .zero
    }
    
    /// Adding Expense to the Swift Data
    func addExpense() {
        let expense = Expense(title: title, subTitle: subTitle, amount: amount, date: date, budget: budget)
        context.insert(expense)
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
}

#Preview {
    AddExpenseScreen()
        .modelContainer(for: [Expense.self, Budget.self])
}
