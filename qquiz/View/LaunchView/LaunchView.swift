//
//  LaunchView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/19/23.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack{
            
            VStack(spacing: 20){
                
                Image("logo01")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -50)
                
                Text("Test your knowledge and have fun!")
                    .font(.system(size: 25))
                    .padding()
 
            }
            .padding(.bottom, 60)
            .multilineTextAlignment(.center)
            
            ZStack {
                
                Rectangle()
                    .frame(height: 70)
                //.foregroundColor(Color(red: 220/255, green: 248/255, blue: 255/255))
                    .foregroundColor(Color(red: 0/255, green: 168/255, blue: 139/255))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .opacity(0.8)
                
                Button {
                    
                    model.firstTime = false
                    
                } label: {
                    Text("Get Start")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }   
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
        
    }
}
