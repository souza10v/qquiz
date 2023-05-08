//
//  ContentView.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            NavigationView {
                ForEach(0..<model.modules.count) { info in
                    VStack{
                        Text(String(info))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
