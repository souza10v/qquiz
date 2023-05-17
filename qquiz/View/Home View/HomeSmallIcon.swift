//
//  HomeIconSmall.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/17/23.
//

import SwiftUI

struct HomeSmallIcon: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
        ZStack (alignment: .center){
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 155, height: 168)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            
            VStack(alignment: .center){
                
                Image(image)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 15)
                    
                Text(title)
                    .bold()
                
                Text(count)
                    .foregroundColor(.gray)
            }
            .padding(10)
        }
        
    }
}

struct HomeSmallIcon_Previews: PreviewProvider {
    static var previews: some View {
        HomeSmallIcon(image: "testSwift", title: "History Quiz", description: "Some description here", count: "12 lessons", time: "2 hours")
    }
}
