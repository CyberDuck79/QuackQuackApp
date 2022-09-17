//
//  ViewController.swift
//  I am poor
//
//  Created by Flavien Henrion on 14/09/2022.
//

import UIKit
import SwiftySound

class ViewController: UIViewController {
    
    let sentences = [
        "Oh yeah that's so good!",
        "Yeah yeah I like that!",
        "So quaaaaaaaack...",
        "I feel you like it too!",
        "Pleeease don't stop it!",
        "..............aaaaaaaah",
        "You're really good....."
    ]
    
    var index = 0
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "Quack Quack Human!"
    }

    @IBAction func duckButton(_ sender: Any) {
        Sound.play(file: "quack.mp3")
        mainLabel.text = sentences[index]
        index += 1
        index %= sentences.count
    }
}

