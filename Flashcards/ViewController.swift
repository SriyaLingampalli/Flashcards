//
//  ViewController.swift
//  Flashcards
//
//  C/Users/sriyalingampalli/Desktop/*desktop/All/2018Internships/CodePath/Flashcards/Flashcards/Base.lproj/Main.storyboardreated by Sriya Lingampalli on 10/13/18.
//  Copyright © 2018 Sriya Lingampalli. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerText: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashcards()
        // Do any additional setup after loading the view, typically from a nib.
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
    if frontLabel.isHidden == false {
        frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        //frontLabel.text = flashcard.question
        //backLabel.text = flashcard.answer
        flashcards.append(flashcard)
        
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Out current index is \(currentIndex)")
        
        updateNextPrevButtons()
        
        //dismiss(animated: true)
        updateLabels()
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
    
    func saveAllFlashcardsToDisk() {
        let dictionaryArray = flashcards.map {(card) -> [String: String] in return ["question": card.question, "answer": card.answer]
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
        }
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
        }
    }

    
}

