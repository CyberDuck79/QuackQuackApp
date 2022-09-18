//
//  ViewController.swift
//  QuackQuackApp
//
//  Created by Flavien Henrion on 14/09/2022.
//

import UIKit
import SwiftySound

class ViewController: UIViewController {
    
    var duck: Talkable?
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let duckType = DuckType.allCases.randomElement()!
        duck = duckType.instanciate(controller: self)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @IBAction func duckButton(_ sender: Any) {
        duck!.talk()
    }
    
    @objc func appMovedToBackground() {
        let duckType = DuckType.allCases.randomElement()!
        duck = duckType.instanciate(controller: self)
    }
}

