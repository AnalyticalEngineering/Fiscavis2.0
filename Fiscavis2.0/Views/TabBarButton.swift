//
//  TabBarButton.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

struct TabBarButton: View {
    @Binding var current : String
    var image : String
    var animation : Namespace.ID
    
    var body: some View {

        Button(action: {
            withAnimation{current = image}
        }) {
            
            VStack(spacing: 5){
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(current == image ? Color("colorBlue") : Color.black.opacity(0.3))
                // default Frame to avoid resizing...
                    .frame(height: 35)
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4)
                    
                    // matched geometry effect slide animation...
                    
                    if current == image{
                        
                        Rectangle()
                            .fill(Color("colorBlue"))
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }
    }
}

