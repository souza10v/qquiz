//
//  TestResultView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/8/23.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var isActive: Bool

    var numCorrect: Int
    var totalQuestion: Int
    
    var resultHeading: String {
        
        let pct = Double(numCorrect)/Double(totalQuestion)
        
        if pct > 0.5 {
            return "Awesome"
        }
        else if pct > 0.2 {
            return "Doing great!"
        }
        else {
            return "Keep Learning"
        }
    }
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Spacer()
            
            ZStack {
                
                Rectangle()
                    .fill(Color(red: 220/255, green: 248/255, blue: 255/255))
                    .frame(height: 80)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
                
                Text(resultHeading)
                    .font(.title)
                    .bold()
            }
            
            Spacer()
            
            VStack(spacing: 25){
                
                Text("You got \(numCorrect) out \(totalQuestion) questions!")
                    .font(.title2)
                
                HStack {
                    
                    Image("coin")
                    
                    VStack(spacing: 5){
                        
                        Text("Points")
                        Text(String(numCorrect * 5))
                            .foregroundColor(Color(red: 0, green: 168/255, blue: 139/255))
                    }
                    .font(.system(size: 25))
                }
            }
            
            Spacer()
            
            Button  {
                
                isActive = false
                print("going to main ")
                    
            } label: {
                
                ZStack {
                    
                    RectangleCard(color: Color(red: 62/255, green: 184/255, blue: 212/255))
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                    
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct TestResultView_Previews: PreviewProvider {
    
    @State static var isActivePop = true
    
    static var previews: some View {
        TestResultView(isActive: $isActivePop, numCorrect: 5, totalQuestion: 10)
            .environmentObject(ContentModel())
    }
}
