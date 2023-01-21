//
// Question.swift
// Quizzler
//


import Foundation

struct Question {
    
    // MARK: - Properties
    
    let text: String
    let answer: String
    
    init(question: String, answers: String) {
        text = question
        answer = answers
    }
}
