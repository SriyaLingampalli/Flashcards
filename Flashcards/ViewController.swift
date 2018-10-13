//
//  ViewController.swift
//  Flashcards
//
//  Created by Sriya Lingampalli on 10/13/18.
//  Copyright © 2018 Sriya Lingampalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapped(_ sender: Any) {
        if frontLabel.isHidden == true {
            frontLabel.isHidden = false
        }
        else if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        }
    }
    
}

