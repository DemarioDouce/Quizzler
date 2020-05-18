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
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Init from model
    var quizBrain = QuizBrain()
    
    
    
    
    //Run when app first load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //Button function
    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
        //Get the value text of the button
        let userAnsswer = sender.currentTitle!
        
        let userGorItRight = quizBrain.checkAnswer(userAnsswer)
        
        if userGorItRight{
            sender.backgroundColor = UIColor.green
            
        }else {
            sender.backgroundColor = UIColor.red
            
        }
        
        quizBrain.nextQuestion()
        
        //Timer
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    
    //Update
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionTitle()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.scoreCheck())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
    }
    
    
}

