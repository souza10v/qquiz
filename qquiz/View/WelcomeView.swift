//
//  WelcomeView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/19/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack{
         
            if model.firstTime == true {
                LaunchView()
            } else {
                HomeView()
            }
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(ContentModel())
    }
}
