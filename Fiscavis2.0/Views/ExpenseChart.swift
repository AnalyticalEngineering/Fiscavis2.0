//
//  ExpenseChart.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI

struct ExpenseChart: View {
    var body: some View {
        ZStack(alignment: .center) {
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .screenWidth, height: .widthPer(per: 1.1) )
                .cornerRadius(25)
            
            ZStack{
                ArcShape()
                    .foregroundColor(.gray.opacity(0.6))
                
                ArcShape(start: 0, end: 230)
                    .foregroundColor(.colorOrange)
                    .shadow( color: .colorGrey.opacity(0.5) , radius: 7)
            }
            .frame(width: .widthPer(per: 0.70), height: .widthPer(per: 0.70) )
            
            
            VStack(spacing: .widthPer(per: 0.04)){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.45) )
                
                Text("$1,235")
                    .font(.customfont(.bold, fontSize: 30))
                    .foregroundColor(.primary)
                
                Text("Total Expenditures")
                    .font(.customfont(.semibold, fontSize: 12))
                    .foregroundColor(.primary)
                Button {
                    HapticManager.notification(type: .success)
                    BudgetScreen()
                } label: {
                    Text("See your budget")
                        .font(.customfont(.semibold, fontSize: 12))
                        .foregroundStyle(.primary)
                }
                .padding(10)
                .background(Color.colorGray.opacity(  0.2 ))
                .overlay {
                    RoundedRectangle(cornerRadius:  16)
                        .stroke( Color.colorGrey, lineWidth: 3)
                }
                .cornerRadius(16)
            }
        }
    }
}

#Preview {
    ExpenseChart()
}
