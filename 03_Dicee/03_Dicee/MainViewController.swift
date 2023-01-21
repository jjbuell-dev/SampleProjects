//
//
// 03_Dicee
// 
// MainViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var diceOneImageView: UIImageView!
    @IBOutlet weak var diceTwoImageView: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceImages = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
        
        diceOneImageView.image = diceImages[Int.random(in: 0...5)]
        diceTwoImageView.image = diceImages[Int.random(in: 0...5)]
    }
}
