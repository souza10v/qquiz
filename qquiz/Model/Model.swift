//
//  Model.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var test: Test
    
}

struct Test: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
    
}

struct Question: Decodable, Identifiable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
    
}

class TestData: Decodable, Encodable, Identifiable {
    
    var id: Int
    var status: String
    
}
