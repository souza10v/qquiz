//
//  ContentModel.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import Foundation
import SwiftUI


class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    @Published var path = NavigationPath()
    
    init() {
        
        getLocalData()
    }
    
    func reset() {
        
        path = NavigationPath()
        
    }
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "tests1", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            try modules = jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
        }
        
        catch {
            // Todo log error
            print("Couln`t parse local data \(error)")
        }
        
    }
    
}
