//
//
// Project02
// 
// MainViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // MARK: - Properties
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // CALayer configurations
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // CALayer colors
        button1.layer.borderColor = UIColor.lightGray.cgColor // converting UIColor to CGColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    // MARK: - Actions
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // check whether the answer is correct
        var title: String
        
        if sender.tag == correctAnswer {
            // adjust the player's score up or down
            title = "Correct"
            score += 1
            
        } else {
            title = "Wrong"
            score -= 1
        }
        
        // show a message telling them what their new score is
        // create a UIAlertController
        let alertController = UIAlertController(title: title, message: "You're score is \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion)) // handler is looking for a closure...
        
        present(alertController, animated: true)
    }
    
    // MARK: - Helper Functions
    
    func askQuestion(action: UIAlertAction! = nil) {
        // shuffle the array
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal) // assigns a UIImage to button
        button2.setImage(UIImage(named: countries[1]), for: .normal) // assigns a UIImage to button
        button3.setImage(UIImage(named: countries[2]), for: .normal) // assigns a UIImage to button
        
        title = countries[correctAnswer].uppercased()
    }
}
