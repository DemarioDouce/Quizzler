//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Demario Douce on 2020-05-18.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    
    //2D array
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //Question skipper variable for array
    var questionNumber = 0
    
    //Score check variable 
    var score = 0
    
    //Check if user answer matches the answer in the array
    mutating func checkAnswer(_ userAnswer:String) -> Bool{
        if userAnswer == quiz[questionNumber].answer{
            //Increase score
            score += 1
            return true
        } else {
            return false
        }
    }
    
    //Get the question from the array
    func getQuestionTitle() -> String{
        
        return quiz[questionNumber].text
    }
    
    //Get the number in float to pass to the progress bar.
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    //Prevent the index out of range error from happening.
    mutating func nextQuestion()  {
        
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
    
    //get the score value
    func scoreCheck() -> Int {
        return score
    }
}
