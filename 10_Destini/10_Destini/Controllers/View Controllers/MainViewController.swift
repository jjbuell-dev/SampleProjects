//
//
// 10_Destini
// 
// MainViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    
    // MARK: - Properties
    
    var storyBrain = StoryBrain()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Actions
    
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        
        updateUI()
    }
    
    // MARK: - Helper Functions
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        choiceButton1.setTitle(storyBrain.getChoice1(), for: .normal)
        choiceButton2.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}
