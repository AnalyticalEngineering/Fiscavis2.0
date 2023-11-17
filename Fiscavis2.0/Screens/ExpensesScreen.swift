//
//  ExpensesScreen.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI
import SwiftData



struct ExpensesScreen: View {
    //MARK:  PROPERTIES
    /// Grouped Expenses Properties
    @Query(sort: [SortDescriptor(\Expense.date, order: .reverse)], animation: .snappy) private var allExpenses: [Expense]
    @Environment(\.modelContext) private var context
    /// Grouped Expenses
    /// This will also be used for filtering purpose
    @State private var groupedExpenses: [GroupedExpenses] = []
    @State private var originalGroupedExpenses: [GroupedExpenses] = []
    @State private var addExpense: Bool = false
    
    /// Search Text
    @State private var searchText: String = ""
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    /// View Properties
    
    /// For Smooth Shape Sliding Effect, We're going to use Matched Geometry Effect
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    
    @State var isHide = false
    
    var body: some View {
        VStack(spacing: 0){
            // App Bar....
            VStack(spacing: 22){
                if !isHide{
                    //MARK: HEADER BAR VIEW
                  
                    Text("hello")
                }
            }
            .padding(.top,top! + 5)
            
            //MARK:  DISAPPEARING EXPENSE ARC SHAPE CHART
            HeaderBarView()
            
            ScrollView(.vertical, showsIndicators: true) {
                ExpenseChart()
                // geomtry reader for getting location values....
                VStack(spacing: 0){
                    
                    // geomtry reader for getting location values....
                    
                    GeometryReader{reader -> AnyView in
                        
                        let yAxis = reader.frame(in: .global).minY
                        
                        // logic simple if if goes below zero hide nav bar
                        // above zero show navbar...
                        
                        if yAxis < 0 && !isHide{
                            
                            DispatchQueue.main.async {
                                withAnimation{isHide = true}
                            }
                        }
                        
                        if yAxis > 0 && isHide{
                            
                            DispatchQueue.main.async {
                                withAnimation{isHide = false}
                            }
                        }
                        
                        return AnyView(
                            Text("")
                                .frame(width: 0, height: 0)
                        )
                    }
                    .frame(width: 0, height: 0)
                    
                    VStack(spacing: 15){
                        
                        ForEach(1...20,id: \.self){i in
                            
                            VStack(spacing: 10){
                                
                                HStack(spacing: 10){
                                    
                                    Image("logo")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        Text("Kavsoft")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Text("\(45 - i) Min")
                                    }
                                    
                                    Spacer(minLength: 0)
                                }
                                
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
                            }
                            .padding()
                            .background(Color.white)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .ignoresSafeArea(.all)
    }
        
    }

    #Preview {
    ExpensesScreen()
}
