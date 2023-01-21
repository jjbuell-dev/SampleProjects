//
// Game.swift
// App_ApplePie
//


import Foundation

struct Game {
    
    // MARK: - Properties
    
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    // computed property
    var formattedWord: String {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"

            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    // method recieves letter, adds to collection, updates moves remaining
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
