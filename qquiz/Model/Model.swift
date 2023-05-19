//
//  Model.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/7/23.
//

import Foundation

class Module: Codable, Identifiable {
    var id: Int
    var category: String
    var test: Test
    
    init(id: Int, category: String, test: Test) {
        self.id = id
        self.category = category
        self.test = test
    }
}

class Test: Codable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var pointsEarned: Int
    var description: String
    var questions: [Question]
    
    init(id: Int, image: String, time: String, pointsEarned: Int, description: String, questions: [Question]) {
        self.id = id
        self.image = image
        self.time = time
        self.pointsEarned = pointsEarned
        self.description = description
        self.questions = questions
    }
}

class Question: Codable, Identifiable {
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
    
    init(id: Int, content: String, correctIndex: Int, answers: [String]) {
        self.id = id
        self.content = content
        self.correctIndex = correctIndex
        self.answers = answers
    }
}
class TestData: Decodable, Encodable, Identifiable {
    
    var id: Int
    var status: String
    
}
