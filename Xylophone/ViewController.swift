//
//  ViewController.swift
//  Xylophone
//
//  Created by Eetu Hernesniemi on 20.9.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        setupPlayerWithKey(keyCharacter: "C")
        super.viewDidLoad()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        setupPlayerWithKey(keyCharacter: (sender.currentTitle?.first)!)
        player?.play()
        visualizeKeyPress(button: sender)
    }
    
    func setupPlayerWithKey(keyCharacter: Character){
        guard let url = Bundle.main.url(forResource: keyCharacter.description, withExtension: "wav") else {
                print("Error. Audio resource url not found")
                return
            }
            do {
                // AVAudioSession initialisation makes the app ready to takeover the device audio. Some devices may throw errors otherwise.
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                player!.prepareToPlay()
            } catch let error as NSError {
                print("Error in playSound func")
                print("Error: \(error.localizedDescription)")
            }
    }
    
    func visualizeKeyPress(button: UIButton){
        button.alpha = 0.5
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            button.alpha = 1.0
        }
    }
    
}

