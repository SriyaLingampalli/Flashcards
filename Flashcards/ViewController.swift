//
//  ViewController.swift
//  Flashcards
//
//  C/Users/sriyalingampalli/Desktop/*desktop/All/2018Internships/CodePath/Flashcards/Flashcards/Base.lproj/Main.storyboardreated by Sriya Lingampalli on 10/13/18.
//  Copyright © 2018 Sriya Lingampalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
    if frontLabel.isHidden == false {
        frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
    

    
}

