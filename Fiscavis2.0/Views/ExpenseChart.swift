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
                .foregroundColor(.colorBlue)
                .cornerRadius(25)
            
            ZStack{
                ArcShape()
                    .foregroundColor(.white.opacity(0.6))
                
                ArcShape(start: 0, end: 230)
                    .foregroundColor(.colorGreen)
                    .shadow( color: .colorGrey.opacity(0.5) , radius: 7)
                
                
                    .overlay {
                        ArcShape()
                            .stroke( Color.black, lineWidth: 1)
                    }
                
            }.padding(.horizontal)
            
            VStack(spacing: 25){
                Text("")
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.55) )
                
                Text("$1,235")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                
                Text("Total Expenditures")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Button {
                    HapticManager.notification(type: .success)
                    BudgetScreen()
                } label: {
                    Text("Review Budget")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
                .padding( 15)
                .background(Color.colorGray.opacity(  0.95 ))
                .overlay {
                    RoundedRectangle(cornerRadius:  16)
                        .stroke( Color.black, lineWidth: 7)
                }
                
                .cornerRadius(16)
                
            }
            
        }
        .frame(width: .widthPer(per: 1.0), height: .widthPer(per: 1.0) )
    }
}

#Preview {
    ExpenseChart()
}
