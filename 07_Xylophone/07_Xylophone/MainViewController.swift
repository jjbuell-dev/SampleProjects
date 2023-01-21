//
//
// 07_Xylophone
// 
// MainViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit
import AVFoundation

class MainViewController: UIViewController {

    // MARK: - Properties
    
    var player: AVAudioPlayer!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSoundFile(soundName: sender.currentTitle!)
        
        // reduce the opacity of the button when pressed
        sender.alpha = 0.5
        // code should execute after a 0.2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // bring sender's opacity back to full
            sender.alpha = 1.0
        }
    }
    
    // MARK: - Helper Functions
    
    func playSoundFile(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
       
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
