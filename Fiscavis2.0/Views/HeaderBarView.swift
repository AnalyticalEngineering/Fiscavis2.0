//
//  HeaderBarView.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

struct HeaderBarView: View {
    //MARK:  PROPERTIES
    @State var showSideMenu: Bool = false
    @State var addExpense: Bool = true
    
    
    
    
    var body: some View {
        HStack(spacing: 5){
            Button(action: {
               showSideMenu = true
                HapticManager.notification(type: .success)
            }) {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 13)
                    .padding(13)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Circle())
            }
            .frame(width: .widthPer(per: 0.2), height: .widthPer(per: 0.1))
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .widthPer(per: 0.5))
                .padding(.horizontal, 10)
               
            Spacer()
            Button(action: {
                addExpense = true
                HapticManager.notification(type: .success)
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 22)
                    .padding(10)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Circle())
            }
            .frame(width: .widthPer(per: 0.2), height: .widthPer(per: 0.1))
            
        }
        
        
    }
}

#Preview {
    HeaderBarView()
}
