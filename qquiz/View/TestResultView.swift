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
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) out \(totalQuestion) questions.")
            
            Spacer()
            
            Button  {
                
                isActive = false
                print("going to main ")
                    
            } label: {
                
                ZStack {
                    
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                    
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct TestResultView_Previews: PreviewProvider {
    
    @State static var isActivePop = true
    
    static var previews: some View {
        TestResultView(isActive: $isActivePop, numCorrect: 5, totalQuestion: 10)
            .environmentObject(ContentModel())
    }
}
