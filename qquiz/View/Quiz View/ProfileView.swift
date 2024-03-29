//
//  ProfileView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/16/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack {
            
            // Profile
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Hello There, \(model.userName)")
                        .font(.title)
                        .bold()
                    
                    Text("Let`s make qquiz")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack{
                    ZStack{
                        
                        Circle()
                            .fill(Color(red: 253/255, green: 189/255, blue: 86/255))
                            .frame(width: 70, height: 70)
                        
                        Image("profileIcon")
                            .padding()
                    }
                }
            }
            
            //Points
            VStack{
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 70)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    VStack{
                        
                        HStack(spacing: 60){
                            
                            HStack {
                                
                                Image("coin")
                                
                                VStack(spacing: 5){
                                    
                                    Text("Points")
                                    Text(String(model.totalPoints))
                                        .foregroundColor(Color(red: 0, green: 168/255, blue: 139/255))
                                        .font(.system(size: 20))
                                }
                            }
                            
                            Divider()
                                .frame(height: 50)
                            
                            HStack {
                                
                                Image("trophy")
                                
                                VStack(spacing: 5){
                                    
                                    Text("Tests")
                                    Text(String(model.modules.count))
                                        .foregroundColor(Color(red: 0, green: 168/255, blue: 139/255))
                                        .font(.system(size: 20))
                                    
                                }
                            }
                        }
                    }
                }
            }
            .onAppear(perform: model.gettingTotalPoints)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView()
            .environmentObject(ContentModel())
    }
}
