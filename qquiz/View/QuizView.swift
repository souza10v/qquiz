//
//  QuizView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/8/23.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var currentIndex = 0
    @State var currentAnswer = 0
    @State var submitted = false
    var questions: [Question]
    
    var body: some View {
        
        let maxIndex = questions.count
        
        VStack(spacing: 20){
            
            // Question number
            Text("Question \(currentIndex + 1) of \(maxIndex)")
            
            // Question
            Text(questions[currentIndex].content)
            
            // Answers
            
            ScrollView{
                
                VStack{
                    
                    ForEach(Array(questions[currentIndex].answers.enumerated()), id: \.offset) {(index, answers) in
                        
                        Button {

                            selectedAnswerIndex = index
//                            currentAnswer += 1

                        } label: {
                            
                            ZStack {
                                
                                if submitted == false {
                                    
                                    RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                }
                                
                                // index == selectedAnswerIndex para entender quando eh clicado
                                
                                else if index ==  questions[currentIndex].correctIndex && index == selectedAnswerIndex {
                                    
                                        RectangleCard(color: Color.green)
                                            .frame(height: 48)
                                    
                                }
                                else if index == selectedAnswerIndex && selectedAnswerIndex != questions[currentIndex].correctIndex {
                                    
                                    RectangleCard(color: Color.red)
                                        .frame(height: 48)
                                    
                                } else if index ==  questions[currentIndex].correctIndex {
                                    
                                    RectangleCard(color: Color.green)
                                        .frame(height: 48)
                                    
                                } else {
                                    
                                    RectangleCard(color: Color.white)
                                        .frame(height: 48)
                                }
                                
                                Text(answers)
                                    .bold()
                                
                            }
                        }
                        .disabled(submitted)
                    }
                }
                .accentColor(.black)
                .padding()
            }
            
            Button {
                
                if submitted == true && currentIndex < maxIndex-1 {
                    
                    currentIndex += 1
                    submitted = false
                    selectedAnswerIndex = nil
                    print("up")
                    
                } else if submitted == true && currentIndex == maxIndex-1 {
                    
                    currentIndex = 0
                    print("reset")
                    
                }
                else {
                    
                    submitted = true
                    print("false")
                    //incrementa pontos
                    
                    
                }
                
            } label: {
                Text("Next")
            }

        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: [
            Question(id: 1, content: "pergunta numero 1", correctIndex: 2, answers: ["aa1","aa2","aa3","aa4"]),
            Question(id: 2, content: "22", correctIndex: 2, answers: ["bb","bb","bb"])]
        )
    }
}


