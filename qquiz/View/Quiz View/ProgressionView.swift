//
//  ProgressionView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/17/23.
//

import SwiftUI

struct ProgressionView: View {
    
    var progressionView: Double
    var maxIndex: Double
    @Binding var isActive: Bool
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 50)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            
            HStack{
                
                Button {
                    isActive = false
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(Color(red: 62/255, green: 184/255, blue: 212/255))
                        .font(.system(size: 30))
                }

                
                ProgressView(value: Double(progressionView), total: Double(maxIndex))
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(Color(red: 62/255, green: 184/255, blue: 212/255))
                    .foregroundColor(.gray)
                    .scaleEffect(1)
                
                Text("\(progressionView, specifier: "%.0f")  / \(maxIndex, specifier: "%.0f")")
                    .padding()
 
            }
            .padding(20)
        }
    }
    
}

struct ProgressionView_Previews: PreviewProvider {
    
    @State static var isActivePop = true
    
    static var previews: some View {
        ProgressionView(progressionView: 3, maxIndex: 10, isActive: $isActivePop)
    }
}
