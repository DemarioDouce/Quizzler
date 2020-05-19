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
        
        //Use the checkAnswer func from quiz brain and pass userAnsswer to it
        let userGorItRight = quizBrain.checkAnswer(userAnsswer)
        
        //Change the color of the buttons if right or wrong
        if userGorItRight{
            sender.backgroundColor = UIColor.green
            
        }else {
            sender.backgroundColor = UIColor.red
            
        }
        
        //Shows next queston
        quizBrain.nextQuestion()
        
        //Timer to allow the colors to be soon as the program is excuted same time
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    
    //Update UI elements 
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionTitle()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.scoreCheck())"
        
        //Restore UI buttons to normal
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
    }
    
    
}

