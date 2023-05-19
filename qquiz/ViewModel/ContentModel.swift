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
    @Published var totalPoints = 20
    
    init() {
        
        getLocalData()
        gettingTotalPoints()

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
    
    func updateData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "tests1", withExtension: "json")
        
        do {
            
            let jsonEncoder = JSONEncoder()
            
            let updatedJSONData = try jsonEncoder.encode(modules)
            
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
    
    func gettingTotalPoints() {
        
        self.totalPoints = modules.reduce(into: 0) { $0 + $1.test.pointsEarned}
        print("loading \(totalPoints) points")
    }

}
