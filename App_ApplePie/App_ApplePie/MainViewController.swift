//
// MainViewController.swift
// App_ApplePie
//
/*
 Additional Stretch items
     - add a scoring feature that awards points for each correct guess and additional points for each successful word completion
     - allow multiple players, switching turns
     - enable keyboard functionality
     - support special characters
     - trait variations to adjust the layout for compact width
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    // MARK: - Properties
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let inCorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()
    }
    
    // MARK: - Actions
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        // read the button title and  determine if letter is in the word
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        updateGameState()
    }
    
    // MARK: - Helper Functions
    
    func newRound() {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: inCorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        
        updateUI()
    
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // MARK: - UI Update
    
    func updateUI() {
        var letters = [String]()
        
        // Stretch - map method converts array of characters to an array of strings
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
