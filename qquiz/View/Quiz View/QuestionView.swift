//
//  QuestionView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/17/23.
//

import SwiftUI

struct QuestionView: View {
    
    var question: String
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(Color(red: 220/255, green: 248/255, blue: 255/255))
                .frame(height: 194)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            
            VStack {
                HStack{
                    Text(question)
                        .font(.title2)
                        .bold()
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: "What is the most popular sport throughout the world?")
    }
}
