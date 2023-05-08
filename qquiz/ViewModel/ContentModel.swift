//
//  ContentModel.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import Foundation


class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    
    init() {
        
        getLocalData()
    }
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data2tests", withExtension: "json")
        
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
