//
//  HomeViewIcon.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/8/23.
//

import SwiftUI

struct HomeViewIcon: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
 
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
                .aspectRatio(CGSize(width: 335, height: 175),
                             contentMode: .fit)
  
            HStack {
                
                // Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Headline
                    Text(title)
                        .bold()
                    
                    // Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // Icons
                    HStack{
                        // Number os lessons/ questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.caption)
                        
                        Spacer()
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.caption)
                    }
                }
                .padding(10)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewIcon_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeViewIcon(image: "testSwift", title: "History Quiz", description: "Some description here", count: "12 lessons", time: "2 hours")
    }
}
