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
       
        //MARK: HEADER BAR VIEW
        HeaderBarView()
        .frame(width: .widthPer(per: 0.9), height: .widthPer(per: 0.1))
        
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
                            
                            if yAxis > 15 && isHide{
                                
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
