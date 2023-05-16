//
//  ContentView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var isRootActive = false
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                ScrollView{
                    
                    LazyVStack(alignment: .leading){
                        
                        // Profile and Points View
                        ProfileView()
                        
                        // Header Text
                        Text("Let`s Play")
                            .bold()
                            .padding(.top, 10)
                            .font(.system(size: 18))
                        
                        // Card Quiz
                        ForEach(model.modules) { info in
                            
                            VStack (spacing: 20){
                                
                                NavigationLink(isActive: $isRootActive) {
                                    
                                    QuizView(isActive: $isRootActive, questions: info.test.questions)
                                    
                                } label: {
                                    
                                    HomeViewIcon(image: info.test.image, title: "Learn \(info.category) Test", description: info.test.description, count: "\(info.test.questions.count) Lessons", time: info.test.time)
                                    
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
