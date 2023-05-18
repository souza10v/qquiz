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
    @Published var userName = "User"
    
    @Published var testData = [TestData]()
    
    init() {
        
        getLocalData()
        getLocalData2()
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
    
    func getLocalData2() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "jsonteste", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            try testData = jsonDecoder.decode([TestData].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.testData = testData
            
        }
        
        catch {
            // Todo log error
            print("Couln`t parse local data \(error)")
        }
        
    }
    
    func updateData2() {
        
        let jsonUrl = Bundle.main.url(forResource: "jsonteste", withExtension: "json")
        
        do {
            
            let jsonEncoder = JSONEncoder()
            
            let updatedJSONData = try jsonEncoder.encode(testData)
            
//            let temporaryURL = URL(fileURLWithPath: NSTemporaryDirectory())
//                .appendingPathComponent("tempData.json")
//            
//            try updatedJSONData.write(to: temporaryURL)
//            
//            try FileManager.default.moveItem(at: temporaryURL, to: jsonUrl!)
            
            try updatedJSONData.write(to: jsonUrl!)
            
            print("JSON file updated and saved to")
            
        }
        
        catch {
            
            print("Couln`t save into local data \(error)")
        }
        
    }
}
