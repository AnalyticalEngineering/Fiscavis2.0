//
//  Fiscavis2_0App.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/15/23.
//

import SwiftUI

@main
struct Fiscavis2_0App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// Setting Up the Container
        .modelContainer(for: [Expense.self, Budget.self])
    }
}
