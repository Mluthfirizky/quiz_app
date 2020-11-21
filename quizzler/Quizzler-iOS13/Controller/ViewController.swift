//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var quizLbl: UILabel!
    
    
    @IBOutlet weak var trueBtn: UIButton!
    
    @IBOutlet weak var falseBtn: UIButton!
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    var timer = Timer()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
    }

    @IBAction func answerBtn(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if actualAnswer {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: true)
    }
    @objc func updateQuiz(){
        quizLbl.text = quizBrain.getQuestionText()
                trueBtn.backgroundColor = UIColor.clear
                falseBtn.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        scoreLbl.text = "score \(quizBrain.getScore())"
        
            }
            
        }
