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
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(keyCharacter: (sender.currentTitle?.first)!)
    }
    
    func playSound(keyCharacter: Character) {
        let url = Bundle.main.url(forResource: keyCharacter.description, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}

