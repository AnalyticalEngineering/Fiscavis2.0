//
//  HomeView.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

struct Home: View {
    // top edge value...
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    /// View Properties
   
    /// For Smooth Shape Sliding Effect, We're going to use Matched Geometry Effect
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    
    @State var isHide = false
    
    var body: some View {
       
        HStack(spacing: 5){
            Button(action: {
                HapticManager.notification(type: .success)
            }) {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.primary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(10)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 45)
                .padding(.horizontal, 10)
               
            Spacer()
            Button(action: {
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
           
            
        }
        .frame(width: .widthPer(per: 0.8), height: .widthPer(per: 0.1))
        
        
            // App Bar....
            VStack(spacing: 10){
                
                // Content....
                
                ScrollView(.vertical, showsIndicators: false) {
                    
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
                                Text("Tes")
                                    .frame(width: 150, height: 30)
                            )
                        }
                        .frame(width: 150, height: 150)
                        
                        VStack(spacing: 15){
                            
                            ForEach(1...20,id: \.self){i in
                                
                                VStack(spacing: 10){
                                    
                                    HStack(spacing: 10){
                                        
                                        Image("logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 35, height: 35)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Text("Fiscavis")
                                                .font(.title2)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            
                                            Text("\(45 - i) Min")
                                        }
                                        
                                        Spacer(minLength: 0)
                                    }
                                    
                                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
                                }
                                .padding(.horizontal)
                                .background(Color.orange)
                                .cornerRadius(15)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }

#Preview {
    Home()
}
