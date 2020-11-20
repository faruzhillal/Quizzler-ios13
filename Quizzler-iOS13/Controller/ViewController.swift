//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
    }
    
    @IBAction func answerBtn(_ sender: UIButton) {
        timer.invalidate()
        
        let userAnser = sender.currentTitle!
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnser)
        
        if actualAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func updateQuiz(){
        quizLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

