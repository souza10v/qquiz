//
//  qquizApp.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import SwiftUI

@main
struct qquizApp: App {
    var body: some Scene {
        WindowGroup {
            //HomeView()
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}


//criar a tela que mostra os pontos
