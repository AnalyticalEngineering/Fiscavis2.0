//
//  HeaderBarView.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

struct HeaderBarView: View {
    //MARK:  PROPERTIES
    @State private var openSideMenu: Bool = false
    @State  private var addExpense: Bool = false
    @State private var searchText: String = ""
    
    
    
    var body: some View {
        
        
        
        HStack{
            Button(action: {
                openSideMenu.toggle()
                HapticManager.notification(type: .success)
            }) {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 13)
                    .padding(13)
                    .background(Color.colorOrange)
                    .clipShape(Circle())
            }
            .frame(width: .widthPer(per: 0.2), height: .widthPer(per: 0.1))
            Spacer()
            Image("app_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .widthPer(per: 0.5))
                .padding(.horizontal, 10)
            
            Spacer()
            Button(action: {
                addExpense.toggle()
                HapticManager.notification(type: .success)
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 22)
                    .padding(10)
                    .background(Color.colorOrange)
                    .clipShape(Circle())
            }
            .frame(width: .widthPer(per: 0.2), height: .widthPer(per: 0.1))
            
        }
        .background(Color.colorBlue)
        .sheet(isPresented: $addExpense) {
            //MARK:  ADD EXPENSE VIEW
            AddExpenseView()
            //                .interactiveDismissDisabled()
        }
        .sheet(isPresented: $openSideMenu) {
            //MARK:  ADD EXPENSE VIEW
            SideMenuView()
            //                .interactiveDismissDisabled()
        }
        Spacer()
    }
}
    

#Preview {
    HeaderBarView()
}
