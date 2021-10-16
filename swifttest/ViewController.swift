//
//  ViewController.swift
//  swifttest
//
//  Created by takuyasudo on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onButtonTouch(_ sender: Any) {
        value = value + 1
        counterLabel.text = "Counter: \(value)"
    }
    
}

