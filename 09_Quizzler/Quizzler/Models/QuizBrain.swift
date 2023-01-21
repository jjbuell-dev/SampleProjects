//
// QuizBrain.swift
// Quizzler
//


import Foundation

struct QuizBrain {
    
    // MARK: - Properties
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(question: "A slug's blood is green.", answers: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answers: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answers: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answers: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answers: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answers: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answers: "False"),
        Question(question: "Google was originally called 'Backrub'.", answers: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answers: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answers: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answers: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answers: "True")
    ]
    
    // MARK: - Helper Functions
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
            
        } else {
            return false
        }
    }
}
