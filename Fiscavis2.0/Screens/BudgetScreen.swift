//
//  BudgetScreen.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI
import SwiftData

struct BudgetScreen: View {
    @Query(animation: .snappy) private var allBudgets: [Budget]
    @Environment(\.modelContext) private var context
    /// View Properties
    @Environment(\.dismiss) private var dismiss
    @State private var addBudgetScreen: Bool = false
    @State private var budgetName: String = ""
    @State private var budgetAmount: Double = 0
    /// Category Delete Request
    @State private var deleteRequest: Bool = false
    @State private var requestedBudget: Budget?
    var body: some View {
        NavigationStack {
            List {
                ForEach(allBudgets.sorted(by: {
                    ($0.expenses?.count ?? 0) > ($1.expenses?.count ?? 0)
                })) { budget in
                    DisclosureGroup {
                        if let expenses = budget.expenses, !expenses.isEmpty {
                            ForEach(expenses) { expense in
                                ExpenseCardView(expense: expense, displayTag: false)
                            }
                        } else {
                            ContentUnavailableView {
                                Label("No Expenses", systemImage: "tray.fill")
                            }
                        }
                    } label: {
                        Text(budget.budgetName)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            deleteRequest.toggle()
                            requestedBudget = budget
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
                }
            }
            .navigationTitle("My Budgets")
            .navigationBarTitleDisplayMode(.inline)
            .overlay {
                if allBudgets.isEmpty {
                    ContentUnavailableView {
                        Label("No Plans, No Sucess.", systemImage: "tray.fill")
                            .foregroundStyle(.primary)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Press '+' button to add a Budget.")
                            .font(.callout)
                            .fontWeight(.bold)
                    }
                }
            }
            /// New Budget Add Button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        HapticManager.notification(type: .success)
                        addBudgetScreen.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(.primary)
                            .fontWeight(.heavy)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        HapticManager.notification(type: .success)
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.primary)
                            .fontWeight(.heavy)
                    }
                }
                
            }
            .sheet(isPresented: $addBudgetScreen) {
                AddBudgetScreen()
            }
        }
        .presentationDetents([.height(200)])
        .presentationCornerRadius(15)
        .interactiveDismissDisabled()
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
    BudgetScreen()
}
