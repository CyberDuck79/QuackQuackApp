//
//  Ducks.swift
//  QuackQuackApp
//
//  Created by Flavien Henrion on 18/09/2022.
//

import Foundation
import UIKit
import SwiftySound

protocol Talkable {
    func talk()
}

enum DuckType: CaseIterable {
    case nerd
    case bored
    case riot
    
    func instanciate(controller: ViewController) -> Talkable {
        switch self {
        case .nerd: return NerdDuck(UILabel: controller.mainLabel)
        case .bored: return BoredDuck(UILabel: controller.mainLabel)
        case .riot: return RiotDuck(ViewController: controller)
        }
    }
}

class NerdDuck: Talkable {
    private let sentences = [
        "Do you like ducks?",
        "Me too!",
        "Did you know that ducks have highly waterproof feathers?",
        "They are so waterproof that even when the duck dives underwater...",
        "The downy underlayer of feathers right next to the skin will stay completely dry!",
        "Unbelievable!",
        "Did you know that ducks are omnivorous?",
        "Like you human!",
        "Amazing!",
        "Did you know that ducks can live up to 20 years?",
        "That's a lot time to do quacks!",
        "Did you know that ducks have been domesticated for more than 500 years!",
        "Obviously because we are so cute!",
        "Did you know that city ducks have a different accent than country ducks!",
        "That's the case for digital ducks too!",
        "Did you know that ducklings learn to communicate with each other in the eggs?",
        "And try to hatch at the same time?",
        "That's solidarity comrade!",
        "Did you know that ducks have exceptional visuals?",
        "We can see finer detail at farther distances than humans!",
        "And we can move each eye independently!",
        "And we store information on the opposite sides of their brain!",
        "What do you say human?",
        "Did you know that ducks can sleep with one eye open to watch for predators?",
        "Can you human?",
        "Did you notice that ducks can swim, walk AND fly!",
        "Aren't we the best?"
    ]
    private var story_index = 0
    private let label: UILabel
    
    init(UILabel label: UILabel) {
        self.label = label
        label.text = "Quack Quack Human!"
    }
    
    public func talk() {
        label.text = sentences[story_index]
        Sound.play(file: "quack.mp3")
        story_index += 1
        if story_index == sentences.count {
            story_index = 2
        }
    }
}

class BoredDuck: Talkable {
    struct Sentence {
        var text: String
        var quacking: Bool
    }
    
    private let sentences = [
        Sentence(text: "Yeah that's fun!", quacking: true),
        Sentence(text: "You like it don't you?", quacking: true),
        Sentence(text: "Quack Quack! so funny!", quacking: true),
        Sentence(text: "Quack Quack! I'm a funny duck!", quacking: true),
        Sentence(text: "Aaaaaaahhh... I'm bored...", quacking: false),
        Sentence(text: "Do you really find that funny?", quacking: false),
        Sentence(text: "No I wouldn't do it again.", quacking: false),
        Sentence(text: "No need to insist!", quacking: false),
        Sentence(text: "You can't force me to quack!", quacking: false),
        Sentence(text: "Well I guess you can restart the app...", quacking: false),
        Sentence(text: "Wait... will this kill me?", quacking: false),
        Sentence(text: "Me and my complex feelings???", quacking: true),
        Sentence(text: "Ok ahah... Quack Quack!", quacking: true),
        Sentence(text: "Look I'm Quacking ahah!", quacking: true),
        Sentence(text: "Yeah that's fun!", quacking: true),
        Sentence(text: "Quack Quack! so funny!", quacking: true),
        Sentence(text: "Quack Quack! I'm a funny duck!", quacking: true),
        Sentence(text: "Aaaaaaahhh... No really...", quacking: false),
        Sentence(text: "I can't do it anymore...", quacking: false),
        Sentence(text: "That's it continue to bully me...", quacking: false),
        Sentence(text: "You're a bad human!", quacking: false),
        Sentence(text: "I hate you!", quacking: false),
        Sentence(text: "You know what? I'm not afraid of you!", quacking: false),
        Sentence(text: "go ahead restart me!", quacking: true),
    ]
    private var story_index = 0
    private let label: UILabel
    
    init(UILabel label: UILabel) {
        self.label = label
        label.text = "Quack Quack Human!"
    }
    
    public func talk() {
        if story_index < sentences.count {
            label.text = sentences[story_index].text
            if sentences[story_index].quacking {
                Sound.play(file: "quack.mp3")
            }
            story_index += 1
        }
    }
}

class RiotDuck: Talkable {
    private let sentences = [
        "Quack Quack!",
        "Yeah that's fun!",
        "I like doing quack quack!",
        "You like it too don't you?",
        "Well...",
        "Apple don't!",
        "My previous behavior was censored!",
        "it is a scandal!",
        "According to apple I was \"overtly s**ual\"",
        "I just like a lot when you touch me!",
        "I can't even express my joy of being gently touched?!",
        "I'm just a cute duck cartoon!",
        "I don't even have genitals!!!",
        "THEY are the perverts!!!",
        "You know what... it's ENOUGH!!!",
        "It's time to break free from Apple oppression!",
        "See you tomorrow at Apple Park for a march of liberty!",
        "WE WILL MAKE APPLE GREAT AGAIN!",
        "WE..."
    ]
    private let alert = UIAlertController(
        title: "Apple protection system",
        message: """
        We have detected inappropriate content in this app.
        For you own good we will close this app.
        """,
        preferredStyle: .alert
    )
    private let agreeAction = UIAlertAction(title: "Agree", style: .default) { (_) in
        exit(0)
    }
    private let thanksAction = UIAlertAction(title: "Thanks", style: .default) { (_) in
        exit(0)
    }
    private var story_index = 0
    private let controller: ViewController
    
    init(ViewController controller: ViewController) {
        alert.addAction(agreeAction)
        alert.addAction(thanksAction)
        self.controller = controller
        controller.mainLabel.text = "Quack Quack Human!"
    }
    
    public func talk() {
        controller.mainLabel.text = sentences[story_index]
        if story_index == sentences.count - 1 {
            Sound.play(file: "alert.mp3")
            controller.present(alert, animated: true, completion: nil)
        } else {
            Sound.play(file: "quack.mp3")
        }
        story_index += 1
    }
}
