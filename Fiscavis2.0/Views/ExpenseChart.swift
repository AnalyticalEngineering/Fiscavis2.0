//
//  ExpenseChart.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/17/23.
//

import SwiftUI

struct ExpenseChart: View {
    var body: some View {
        VStack(alignment: .center) {
          
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
            
            VStack(spacing: 0){
                
                Text("$1,235")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: .widthPer(per: 0.3), height: .widthPer(per: 0.5) )
                Text("Total Expenditures")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Button {
                    HapticManager.notification(type: .success)
                    AddBudgetScreen()
                } label: {
                    Text("Review Budget")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
                .padding( 15)
                .background(Color.colorGray.opacity(  0.95 ))
                .overlay {
                    RoundedRectangle(cornerRadius:  10)
                        .stroke( Color.black, lineWidth: 7)
                }
                .frame(width: .widthPer(per: 0.5), height: .widthPer(per: 0.5) )
            }
            .frame(width: .widthPer(per: 0.4), height: .widthPer(per: 0.0) )
        }
        .frame(width: .widthPer(per: 0.8), height: .widthPer(per: 0.2) )
        
    }
       
}

#Preview {
    ExpenseChart()
}
