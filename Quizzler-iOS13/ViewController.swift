//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //UI elements
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //data source
    let quiz = [
    ["4 + 2 = 6", "True"],
    ["5 - 3 > 1", "True"],
    ["3 + 8 < 10", "False"]
    ]
    
    //counter
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    //button function
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnsswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnsswer == actualAnswer{
            print("Right!")
        }else {
            print("Wong!")
        }
       
        
        //Check if the question number is less than quiz array
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            
            questionNumber = 0
        }
        
         updateUI()
        
    }
    
    //Update array
    func updateUI(){
        
        questionLabel.text = quiz[questionNumber][0]
        
    }
    
}

