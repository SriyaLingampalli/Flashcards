//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Sriya Lingampalli on 10/27/18.
//  Copyright © 2018 Sriya Lingampalli. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerText: UITextField!
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let question = questionText.text
        let answer = answerText.text
        
        flashcardsController.updateFlashcard(question: question!, answer: answer!)
        
        dismiss(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
