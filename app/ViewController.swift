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
    }

    @IBAction func duckButton(_ sender: Any) {
        duck!.talk()
    }
}

